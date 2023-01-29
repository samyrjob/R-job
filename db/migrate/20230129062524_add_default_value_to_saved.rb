class AddDefaultValueToSaved < ActiveRecord::Migration[7.0]

    def up
      change_column :savedoffers, :saved, :boolean, default: false
    end

    def down
      change_column :savedoffers, :saved, :boolean, default: nil
    end

end
