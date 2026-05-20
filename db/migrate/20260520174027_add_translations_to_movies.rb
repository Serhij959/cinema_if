class AddTranslationsToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :title_en, :string
    add_column :movies, :genre_en, :string
    add_column :movies, :duration_en, :string
    add_column :movies, :description_en, :text
  end
end
