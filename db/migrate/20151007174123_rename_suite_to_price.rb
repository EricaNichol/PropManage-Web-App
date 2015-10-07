class RenameSuiteToPrice < ActiveRecord::Migration
  def change
    rename_column :listings, :suite_no, :price
  end
end
