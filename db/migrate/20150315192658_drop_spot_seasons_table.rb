class DropSpotSeasonsTable < ActiveRecord::Migration
  def up
    drop_table :spot_seasons
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
