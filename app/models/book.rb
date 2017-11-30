class Book < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :name, scope: :user
  validates_uniqueness_of :key
  validates :name, :key, :description, :latitude, :longitude, presence: true
  has_many :documents, dependent: :destroy
end
