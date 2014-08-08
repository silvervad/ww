class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :img_path
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
