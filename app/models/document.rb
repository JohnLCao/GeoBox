class Document < ActiveRecord::Base
  belongs_to :user
  validates :filename, uniqueness: true
  validates :filename, :attachment, :user, :description, :latitude, :longitude, presence: true
  mount_uploader :attachment, AttachmentUploader
end
