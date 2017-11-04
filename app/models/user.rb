class User < ActiveRecord::Base
	has_secure_password
	has_many :documents
	validates :username, :password_digest, :presence => true
	validates :username, uniqueness: true
	validates :email, uniqueness: true
  	validates_confirmation_of :password
	validates :password_confirmation, presence: true
	VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_REGEX },
	                  uniqueness: { case_sensitive: false }
	validates :user_class, presence: true, inclusion: {:in => ['admin', 'regular']}

	$curr_latlng = {lat: '49.2776421', lng: '-122.9170006'}

	# TODO tobe parametized later
	def setCurrLatlng(latlng)
		$curr_latlng = latlng
	end

	def getCurrLatlng
		$curr_latlng
	end

end
