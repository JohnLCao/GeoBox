class User < ActiveRecord::Base
	has_secure_password
	validates :username, :password_digest, :presence => true
	validates :username, uniqueness: true
	validates :email, uniqueness: true
  validates_confirmation_of :password
	validates :password_confirmation, presence: true
	VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_REGEX },
	                  uniqueness: { case_sensitive: false }

end
