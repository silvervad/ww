class CreateSportsSpots < ActiveRecord::Migration
  def change
    create_table :sports_spots do |t|
   	  t.belongs_to :spot
      t.belongs_to :sport
    end
    add_index :sports_spots, :spot_id
    add_index :sports_spots, :sport_id
    add_index :sports_spots, [:spot_id, :sport_id], unique: true
  end
end
