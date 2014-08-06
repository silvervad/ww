class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :spot_id
      t.integer :sports
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :link
      t.integer :affiliation

      t.timestamps
    end
  end
end
