class AddSeveralColumnsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :phone_number, :string
    add_column :students, :mobility, :string
    add_column :students, :year, :string
    add_column :students, :wanted_area, :string
    add_column :students, :disponibility, :date
  end
end
