class HomeController < ApplicationController
  def index
    @days = build_days_from_database
    @announcements = Announcement.order(created_at: :desc).limit(4)
    @promotions = Promotion.where(active: true).order(created_at: :desc)
  end
end
private

def build_days_from_database
  dates = Screening
    .where("show_date >= ?", Date.today)
    .order(:show_date)
    .pluck(:show_date)
    .uniq
    .first(10)

  dates.map do |date|
    screenings = Screening
      .includes(:movie, :hall)
      .where(show_date: date)
      .order(:show_time)

    movies = screenings.group_by(&:movie).map do |movie, movie_screenings|
      {
        title: movie.localized_title,
        genre: movie.localized_genre,
        duration: movie.localized_duration,
        age: movie.age,
        poster: movie.poster,
        description: movie.localized_description,

        sessions: movie_screenings.map do |screening|
          {
            id: screening.id,
            time: screening.show_time,
            format: screening.format,
            hall: screening.hall.name
          }
        end
      }
    end

    {
      date: date.strftime("%d"),
      label: day_label(date),
      movies: movies
    }
  end
end

def day_label(date)
  today = Date.today

  return I18n.t("days.today") if date == today
  return I18n.t("days.tomorrow") if date == today + 1

  weekday = date.strftime("%A").downcase
  I18n.t("weekdays.#{weekday}")
end
