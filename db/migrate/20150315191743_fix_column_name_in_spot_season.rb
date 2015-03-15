class FixColumnNameInSpotSeason < ActiveRecord::Migration
  def self.up
    rename_column :spot_seasons, :collection, :seasons_string
  end

  def self.down
    rename_column :spot_seasons, :seasons_string, :collection
  end
end
