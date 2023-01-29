class RenameEndDateToDuration < ActiveRecord::Migration[7.0]
  def change
    rename_column :offers, :end_date, :duration
  end
end
