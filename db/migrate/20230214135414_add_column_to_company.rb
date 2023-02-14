class AddColumnToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :website, :string
  end
end
