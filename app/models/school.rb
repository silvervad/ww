class School < ActiveRecord::Base
	belongs_to :spot
	has_many :photos, as: :imageable, dependent: :destroy
end
