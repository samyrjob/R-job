class AddColumnSavedToOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :saved, :boolean, default: false
  end
end
