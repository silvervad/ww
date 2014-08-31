class Sport < ActiveRecord::Base
	has_and_belongs_to_many :spots, join_table: "spots_sports"
	table_name = 'Sports'
	has_many :seasons
end
