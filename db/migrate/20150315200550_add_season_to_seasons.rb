class AddSeasonToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :season, :string, limit: 10
  end
end
