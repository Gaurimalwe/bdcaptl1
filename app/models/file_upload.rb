class FileUpload < ActiveRecord::Base
  attr_accessible :description, :name, :picture
mount_uploader :picture, PictureUploader
belongs_to :create_owner

end
