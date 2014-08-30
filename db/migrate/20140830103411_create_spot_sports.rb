class CreateSpotSports < ActiveRecord::Migration
  def change
    create_table :spot_sports do |t|
   	  t.belongs_to :spot
      t.belongs_to :sport
    end
    add_index :spot_sports, :spot_id
    add_index :spot_sports, :sport_id
    add_index :spot_sports, [:spot_id, :sport_id], unique: true
  end
end
