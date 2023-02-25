class ChangeDurationInOffers < ActiveRecord::Migration[7.0]

    change_table :offers do |t|
      t.change :duration, :string
    end

end
