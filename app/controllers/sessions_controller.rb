class SessionsController < ApplicationController
	  skip_before_action :ensure_login, only: [:new, :create, :guest]

	  def new
	  	# will invoke new.html.erb
	  end

	  def create
	  		user = User.find_by(username: params[:user][:username].strip)
	  		password = params[:user][:password]

	  	if user && user.authenticate("#{password}")
	  		session[:user_id] = user.id
  			redirect_to admin_root_path and return if is_admin?
	  		redirect_to root_path, success: "Logged in succesfully"
	  	else
	  		redirect_to login_path, danger: "Invalid username/password combination!"
	  	end
	  end

	  def destroy
	  	reset_session
		redirect_to login_path, success: "You have been logged out"
	  end

	  def guest
	  	session[:guest] = true
	  	redirect_to root_path, info: "Logged in as guest"
	  end
end
