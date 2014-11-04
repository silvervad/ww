class AddIndexesToSeasons < ActiveRecord::Migration
  def change
  	add_index :seasons, :spot_id
  	add_index :seasons, :sport_id
  end
end
