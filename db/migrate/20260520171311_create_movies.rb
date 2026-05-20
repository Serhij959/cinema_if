class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :duration
      t.string :age
      t.string :poster
      t.text :description

      t.timestamps
    end
  end
end
