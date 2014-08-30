class RemoveSportFromSpots < ActiveRecord::Migration
  def up
  	remove_column :spots, :sport
  end

  def down
  	  	change_table :spots do |t|
  			t.integer :sport
  		end
  end
end
