class Spot < ActiveRecord::Base
	after_initialize :set_seasons
	has_many :schools
	has_many :photos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photos

  
  has_and_belongs_to_many :sports

	serialize :seasons
end

  private

    def set_seasons
      self.seasons ||= [0,0,0,0,0,0,0,0,0,0,0,0]
    end

