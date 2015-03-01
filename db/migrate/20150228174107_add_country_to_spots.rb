class AddCountryToSpots < ActiveRecord::Migration
  def change
    add_reference :spots, :country, index: true
  end
end
