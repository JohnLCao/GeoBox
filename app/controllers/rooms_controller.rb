class RoomsController < ApplicationController
	before_action :ensure_not_guest, only: [:new, :create]

	def index

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

	end

	private
	    def room_params
	      params.require(:room).permit(:description,:name)
	    end
end