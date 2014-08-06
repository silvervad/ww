class AddIndexesToSpotsSchools < ActiveRecord::Migration
  def change
  		add_index :spots, :name
  		add_index :schools, :name
  		add_index :schools, :spot_id
  end
end
