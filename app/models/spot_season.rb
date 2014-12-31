class SpotSeason < ActiveRecord::Base
	belongs_to :spots
	validates :collection,  presence: true
	validates :spot_id,  presence: true
end
