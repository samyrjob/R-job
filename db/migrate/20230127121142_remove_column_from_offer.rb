class RemoveColumnFromOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :duration, :date
  end
end
