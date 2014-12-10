class RenameTableSpotsSportsToSportsSpots < ActiveRecord::Migration
  def change
     rename_table :spots_sports, :sports_spots
   end
end
