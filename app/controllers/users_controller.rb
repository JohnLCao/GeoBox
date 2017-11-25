class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: :index
  skip_before_action :ensure_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: [:updateLocation, :userInfo]

  include DocumentsHelper


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def updateLocation
    session[:latitude] = loc_params[:lat]
    session[:longitude] = loc_params[:lng] 
    render json: DocumentsHelper.fetchfiles({lat: loc_params[:lat], lng: loc_params[:lng]})
                                .map{|doc| doc.attributes.merge({
                                  created_at_ms: doc.created_at.to_f,
                                  username: User.find(doc.user_id).username,
                                  download_url: doc.attachment.url
                                })}
                 .concat(
                  BooksHelper.fetchbooks({lat: loc_params[:lat], lng: loc_params[:lng]})
                                .map{|book| book.attributes.merge({
                                  is_book: true,
                                  created_at_ms: book.created_at.to_f,
                                  username: User.find(book.user_id).username
                                })}
                  )
  end

  def userInfo
    if session[:user_id]
      user = User.find(session[:user_id])
      censored = ["id", "password_digest"] + (user.user_class=='admin' ? [] : ["user_class"])
      user_data = user.attributes
                  .except(*censored)
                  .merge({
                    created_at_ms: user.created_at.to_f,
                    updated_at_ms: user.updated_at.to_f,
                    owned_documents: user.documents
                  })
    else
      user_data = {guest: true}
    end
    render json: user_data
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id if session[:user_id].nil?
        format.html { redirect_to root_path, success: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:danger] = @user.errors.collect { |key, value| "#{key.capitalize} #{value}" }.first
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params) # users not allowed to change their class
        format.html { redirect_to @user, info: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:danger] = @user.errors.collect { |key, value| "#{key.capitalize} #{value}" }.first
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, success: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def loc_params
      params.permit(:lat, :lng)
    end
end
