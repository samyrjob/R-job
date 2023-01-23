class RenameTheColumnTypeToProfile < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :type, :profile
  end
end
