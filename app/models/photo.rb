class Photo < ActiveRecord::Base
	belongs_to :spot
	
	mount_uploader :image, ImageUploader

end
