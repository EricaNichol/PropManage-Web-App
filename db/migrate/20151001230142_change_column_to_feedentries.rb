class ChangeColumnToFeedentries < ActiveRecord::Migration
  def change
    rename_column :feed_entries, :image, :image_craigslist
  end
end
