class AddColumnsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :school, :string
    add_column :students, :type, :string
  end
end
