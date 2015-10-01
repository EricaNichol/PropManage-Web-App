class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :features, :tag, :name
  end
end
