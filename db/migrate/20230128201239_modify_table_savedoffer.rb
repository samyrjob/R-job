class ModifyTableSavedoffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :savedoffers, :saved, :boolean
  end
end
