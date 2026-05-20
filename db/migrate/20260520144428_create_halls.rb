class CreateHalls < ActiveRecord::Migration[8.1]
  def change
    create_table :halls do |t|
      t.string :name
      t.integer :rows
      t.integer :seats_per_row
      t.string :hall_type

      t.timestamps
    end
  end
end
