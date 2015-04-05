class DropSportsSpotsTable < ActiveRecord::Migration
  def up
    drop_table :sports_spots
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
