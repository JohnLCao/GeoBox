class Room < ActiveRecord::Base
	belongs_to :user
	has_many :messages, dependent: :destroy

	validates_uniqueness_of :name, scope: :user
  	validates :name, :description, :latitude, :longitude, presence: true
end
