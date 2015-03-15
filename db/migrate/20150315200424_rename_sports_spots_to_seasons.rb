class RenameSportsSpotsToSeasons < ActiveRecord::Migration
  def self.up
    rename_table :sports_spots, :seasons
  end 
  def self.down
    rename_table :seasons, :sports_spots
  end
end
