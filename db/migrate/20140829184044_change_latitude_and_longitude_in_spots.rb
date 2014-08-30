class ChangeLatitudeAndLongitudeInSpots < ActiveRecord::Migration

  def up
    change_column :spots, :latitude, :decimal, precision: 10, scale: 6
    change_column :spots, :longitude, :decimal, precision: 10, scale: 6
  end

  def down
	change_column :spots, :latitude, :decimal
	change_column :spots, :longitude, :decimal
  end
end
