class CreateSpotSeasons < ActiveRecord::Migration
  def change
    create_table :spot_seasons do |t|
      t.string :collection
      t.references :spot, index: true
 
      t.timestamps
    end
  end
end
