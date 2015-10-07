class AddColumnToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :address, :string
  end
end
