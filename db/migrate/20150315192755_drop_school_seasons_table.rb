class DropSchoolSeasonsTable < ActiveRecord::Migration
  def up
    drop_table :school_seasons
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
