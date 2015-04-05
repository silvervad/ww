class Spot < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [ :slugged, :history ]
  #after_initialize :set_seasons
  belongs_to :country
  has_many :schools
  has_many :photos, as: :imageable, dependent: :destroy
  
  has_many :seasons
  has_many :sports, through: :seasons
  
  accepts_nested_attributes_for :photos, :sports, :seasons

   def should_generate_new_friendly_id?
     name_changed?
  end
end
