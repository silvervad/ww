class School < ActiveRecord::Base
	belongs_to :spot
	has_many :photos, as: :imageable, dependent: :destroy
	validates :name,  presence: true, length: { maximum: 50 }
	validates :link,  presence: true
	validates :spot_id,  presence: true
	validates :sports,  presence: true
	validates :latitude,  presence: true
	validates :longitude,  presence: true
	validates :affiliation,  presence: true

  has_many :seasons, class_name: "SchoolSeason"
end
