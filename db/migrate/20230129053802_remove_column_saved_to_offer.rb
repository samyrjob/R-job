class RemoveColumnSavedToOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :saved, :boolean, default: false
  end
end
