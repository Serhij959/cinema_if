class Announcement < ApplicationRecord
  def localized_title
    I18n.locale == :en && title_en.present? ? title_en : title
  end

  def localized_description
    I18n.locale == :en && description_en.present? ? description_en : description
  end
end
