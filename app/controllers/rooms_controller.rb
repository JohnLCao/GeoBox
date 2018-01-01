class RoomsController < ApplicationController
	before_action :ensure_admin, only: :index
	before_action :ensure_not_guest, only: [:new, :create]
	before_action :set_room, only: [:show, :edit, :update, :destroy]

	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end 

	def create
	    @room = Room.new(room_params)
	    @room[:user_id] = session[:user_id]
	    @room[:latitude] = session[:latitude]
	    @room[:longitude] = session[:longitude]

	    respond_to do |format|
	      if @room.save
	        format.html { redirect_to root_path, success: 'Room was successfully created.' }
	        format.json { render :show, status: :created, location: @room }
	      else
	        flash[:danger] = @room.errors.collect { |key, value| "#{key.capitalize} #{value}" }.first
	        format.html { render :new }
	        format.json { render json: @room.errors, status: :unprocessable_entity }
	      end
	    end
	end

 	def show
	end

  	def edit
	end

  	def update
	end

	def destroy
		@room.destroy
	    respond_to do |format|
	      format.html { redirect_to rooms_url, success: 'Room was successfully deleted.' }
	      format.json { head :no_content }
	    end
	end

	private
	    def room_params
	      params.require(:room).permit(:description,:name)
	    end

	    def set_room
	    	@room = Room.find(params[:id])
	    end
end