class Spot < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [ :slugged, :history ]
	#after_initialize :set_seasons
	belongs_to :country
	has_many :schools
	has_many :photos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_and_belongs_to_many :sports

  has_many :seasons, class_name: "SpotSeason"
  
  def should_generate_new_friendly_id?
     name_changed?
  end
end
