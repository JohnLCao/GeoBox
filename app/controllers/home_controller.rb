class HomeController < ApplicationController
	before_action :ensure_admin, only: :admin_home
	skip_before_action :ensure_login, only: :home

	def home
		session[:guest] = true unless session[:user_id] 
	end

	def admin_home
	end
end
