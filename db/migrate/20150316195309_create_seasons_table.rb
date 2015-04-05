class CreateSeasonsTable < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.belongs_to :spot, index: true
      t.belongs_to :sport, index: true
      t.string :months, limit: 12
      t.timestamps null: false
    end
    
    add_index :seasons, [:spot_id, :sport_id]
  end
end
