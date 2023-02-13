class AddColumnToTag < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :domaine, :string
  end
end
