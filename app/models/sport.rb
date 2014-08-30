class Sport < ActiveRecord::Base
	has_many :spot_sports
	has_many :spots, through: :spot_sports
end
