class RemoveSpotIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :spot_id, :integer
  end
end
