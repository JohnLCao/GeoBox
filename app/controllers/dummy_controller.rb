class DummyController < ApplicationController
	before_action :ensure_admin, only: :admin_home
	
	def home
		@documents = Document.all
		#could be @documents = Document.where(mutual_radius==true)
		#@documents = Document.where(latitude: (@lat)..(@lat+1))
	end

		def newcoords
		@lat = params[:lat]
		@lng = params[:lng]
		render json: @lng
	end

	def admin_home
	end

	def angular_example
	end
end
