class Spot < ActiveRecord::Base
	after_initialize :set_seasons
	has_many :schools

	serialize :seasons

end



  private


    def set_seasons
      self.seasons ||= [0,0,0,0,0,0,0,0,0,0,0,0]
    end

