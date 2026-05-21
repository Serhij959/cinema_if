class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :screening, null: false, foreign_key: true
      t.integer :row_number
      t.integer :seat_number
      t.integer :price
      t.string :status
      t.string :ticket_token

      t.timestamps
    end
  end
end
