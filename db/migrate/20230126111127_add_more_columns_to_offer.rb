class AddMoreColumnsToOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :town, :string
    add_column :offers, :salary, :float
    add_column :offers, :start_date, :date
    add_column :offers, :end_date, :date
    add_column :offers, :end_activation, :date
  end
end
