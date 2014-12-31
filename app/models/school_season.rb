class SchoolSeason < ActiveRecord::Base
	belongs_to :school
	validates :collection,  presence: true
	validates :school_id,  presence: true

end
