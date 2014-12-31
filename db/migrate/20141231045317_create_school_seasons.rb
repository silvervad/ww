class CreateSchoolSeasons < ActiveRecord::Migration
  def change
    create_table :school_seasons do |t|
      t.string :collection
      t.references :school, index: true
 
      t.timestamps
    end
  end
end
