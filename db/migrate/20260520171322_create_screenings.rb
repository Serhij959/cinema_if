class CreateScreenings < ActiveRecord::Migration[8.1]
  def change
    create_table :screenings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :hall, null: false, foreign_key: true
      t.date :show_date
      t.string :show_time
      t.string :format
      t.integer :price

      t.timestamps
    end
  end
end
