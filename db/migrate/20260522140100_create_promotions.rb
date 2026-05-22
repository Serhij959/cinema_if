class CreatePromotions < ActiveRecord::Migration[8.1]
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :title_en
      t.string :image
      t.text :description
      t.text :description_en
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
