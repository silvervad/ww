class RemoveSeasonsFromSpot < ActiveRecord::Migration
  def change
  	remove_column :spots, :seasons, :string
  end

end
