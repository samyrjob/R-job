class AddpowerToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :power, :boolean, :default => false
  end
end
