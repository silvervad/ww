class DropSeasonsTable < ActiveRecord::Migration
  def up
    drop_table :seasons
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
