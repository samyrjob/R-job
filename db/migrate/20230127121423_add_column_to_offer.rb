class AddColumnToOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :duration, :integer
  end
end
