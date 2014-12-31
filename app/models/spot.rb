class Spot < ActiveRecord::Base
	#after_initialize :set_seasons
	has_many :schools
	has_many :photos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_and_belongs_to_many :sports

  has_many :seasons, class_name: "SpotSeason"
end
