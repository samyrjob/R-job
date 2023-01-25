class ChangeColumnStatusFromApplication < ActiveRecord::Migration[7.0]
  def change
    change_column_default :applications, :status, 'pending'
  end
end
