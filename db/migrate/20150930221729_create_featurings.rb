class CreateFeaturings < ActiveRecord::Migration
  def change
    create_table :featurings do |t|
      t.references :listing, index: true, foreign_key: true
      t.references :feature, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
