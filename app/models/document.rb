class Document < ActiveRecord::Base
  belongs_to :user
  validates :filename, :attachment, :user, :description, :latitude, :longitude, :presence => true
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
end
