class HomeController < ApplicationController
	before_action :ensure_admin, only: :admin_home

	def home

	end

	def admin_home
	end

	def angular_example
	end
end
