class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: :index
  before_action :ensure_not_guest, only: [:new, :create]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book[:user_id] = session[:user_id]
    @book[:latitude] = session[:latitude]
    @book[:longitude] = session[:longitude]

  #TODO: add files to book... ...

    print(@book.attachment)
    respond_to do |format|
      if @book.save
        format.html { redirect_to root_path, success: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        flash[:danger] = @book.errors.collect { |key, value| "#{key.capitalize} #{value}" }.first
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  #TODO: need to update with files
  def update
    redirect_to controller: 'documents', action: 'new', book_id: @book.id
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, success: 'Book was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:description,:key,:name)
    end
end
