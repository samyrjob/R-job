class AddLinkedinToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :linkedin, :string
  end
end
