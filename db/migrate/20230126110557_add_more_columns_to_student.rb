class AddMoreColumnsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :description, :text
    add_column :students, :status, :string
    add_column :students, :tongues, :string
  end
end
