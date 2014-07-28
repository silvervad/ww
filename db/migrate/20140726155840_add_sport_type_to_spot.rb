class AddSportTypeToSpot < ActiveRecord::Migration
  def change
  	change_table :spots do |t|
  		t.integer :sport
  	end
  end
end
