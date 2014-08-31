class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :jan, limit: 1
      t.integer :feb, limit: 1
      t.integer :mar, limit: 1
      t.integer :apr, limit: 1
      t.integer :may, limit: 1
      t.integer :jun, limit: 1
      t.integer :jul, limit: 1
      t.integer :aug, limit: 1
      t.integer :sep, limit: 1
      t.integer :oct, limit: 1
      t.integer :nov, limit: 1
      t.integer :dec, limit: 1
      t.references :sport
      t.references :spot

      t.timestamps
    end

    add_index :seasons, [:jan, :feb, :mar, :apr, :may, :jun, :jul, :aug,
                            :sep, :oct, :nov, :dec], name: 'index_seasons_on_months'
  end
end
