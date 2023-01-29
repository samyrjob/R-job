class ModifyTableSavedofferAgain < ActiveRecord::Migration[7.0]
  def change

    add_column :savedoffers, :saved, :boolean
  end
end
