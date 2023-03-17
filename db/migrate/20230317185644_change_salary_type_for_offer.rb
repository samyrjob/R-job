class ChangeSalaryTypeForOffer < ActiveRecord::Migration[7.0]
  def change
    change_column(:offers, :salary, :string)
  end
end
