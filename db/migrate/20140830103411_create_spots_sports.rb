class CreateSpotsSports < ActiveRecord::Migration
  def change
    create_table :spots_sports, id: false do |t|
   	  t.belongs_to :spot
      t.belongs_to :sport
    end
    add_index :spots_sports, :spot_id
    add_index :spots_sports, :sport_id
    add_index :spots_sports, [:spot_id, :sport_id], unique: true
  end
end
