class AddMoreColumnsToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :description, :text
    add_column :companies, :structure, :string
  end
end
