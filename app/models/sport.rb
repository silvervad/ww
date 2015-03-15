class Sport < ActiveRecord::Base
	has_many :seasons
	has_many :spots, through: :seasons
end
