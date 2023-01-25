class AddColumnToSavedoffer < ActiveRecord::Migration[7.0]
  def change
    add_column :savedoffers, :saved, :boolean, default: false
  end
end
