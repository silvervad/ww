class AddSeasonsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :seasons, :string
  end
end
