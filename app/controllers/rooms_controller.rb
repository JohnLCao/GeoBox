class RoomsController < ApplicationController
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

	private
	    def room_params
	      params.require(:room).permit(:description,:name)
	    end
end