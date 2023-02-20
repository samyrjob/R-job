class ChangeDateFromOffer < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :duration, :string
  end
end
