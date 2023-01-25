class CreateSavedoffers < ActiveRecord::Migration[7.0]
  def change
    create_table :savedoffers do |t|
      t.references :student, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
