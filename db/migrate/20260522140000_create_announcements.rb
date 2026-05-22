class CreateAnnouncements < ActiveRecord::Migration[8.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :title_en
      t.string :poster
      t.string :release_date
      t.text :description
      t.text :description_en

      t.timestamps
    end
  end
end
