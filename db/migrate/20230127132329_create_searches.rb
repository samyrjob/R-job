class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :sector
      t.string :town
      t.string :start_date
      t.integer :min_duration
      t.integer :max_duration
      t.float :min_salary

      t.timestamps
    end
  end
end
