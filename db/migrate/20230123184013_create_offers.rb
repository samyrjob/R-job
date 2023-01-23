class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.text :description
      t.string :function
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
