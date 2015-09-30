class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.string :description
      t.string :url
      t.datetime :published_date
      t.string :guid
      t.string :image
      t.string :price

      t.timestamps null: false
    end
  end
end
