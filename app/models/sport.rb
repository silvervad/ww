class Sport < ActiveRecord::Base
	has_and_belongs_to_many :spots
	has_many :seasons
end
