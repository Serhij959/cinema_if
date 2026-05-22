class Movie < ApplicationRecord
  has_many :screenings

  def localized_title
    I18n.locale == :en && title_en.present? ? title_en : title
  end

  def localized_genre
    I18n.locale == :en && genre_en.present? ? genre_en : genre
  end

  def localized_duration
    I18n.locale == :en && duration_en.present? ? duration_en : duration
  end

  def localized_description
    I18n.locale == :en && description_en.present? ? description_en : description
  end
end
