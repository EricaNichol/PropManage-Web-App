class AddLongitudeAndLatitudeToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :longitude, :float
    add_column :feed_entries, :latitude, :float
  end
end
