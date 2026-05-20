require "date"

class CinemaSchedule
  def self.days
    today = Date.today

    all_days
      .select { |day| day[:date] >= today }
      .map do |day|
        {
          date: day[:date].strftime("%d"),
          label: day_label(day[:date]),
          movies: day[:movies]
        }
      end
  end

  def self.day_label(date)
    today = Date.today

    return I18n.t("days.today") if date == today
    return I18n.t("days.tomorrow") if date == today + 1

    weekday = date.strftime("%A").downcase

    I18n.t("weekdays.#{weekday}")
  end
  def self.weekday_name(date)
    names = {
      1 => "понеділок",
      2 => "вівторок",
      3 => "середа",
      4 => "четвер",
      5 => "пʼятниця",
      6 => "субота",
      0 => "неділя"
    }

    names[date.wday]
  end

  def self.all_days
    [
      {
        date: Date.new(2026, 5, 20),
        movies: [
          # ФІЛЬМИ НА 20 ЧИСЛО

          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          },
          {
            title: "Дедпул і Росомаха",
            genre: "Бойовик, комедія",
            duration: "2 год 7 хв",
            age: "16+",
            description: "Дедпул повертається разом із Росомахою для найшаленішої місії Marvel.",
            poster: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
            sessions: [
             { time: "12:30", format: "2D", hall: "Зал 1" },
             { time: "15:10", format: "3D", hall: "Зал 3" },
             { time: "18:40", format: "LUX", hall: "LUX 1" },
             { time: "21:00", format: "2D", hall: "Зал 2" },
             { time: "22:30", format: "3D", hall: "Зал 4" },
             { time: "23:50", format: "LUX", hall: "LUX 2" }
            ]
          },
          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          },
          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          },
          {
            title: "Дедпул і Росомаха",
            genre: "Бойовик, комедія",
            duration: "2 год 7 хв",
            age: "16+",
            poster: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
            sessions: [
              { time: "12:30", format: "2D" },
              { time: "15:10", format: "3D" },
              { time: "18:40", format: "LUX" },
              { time: "12:30", format: "2D" },
              { time: "15:10", format: "3D" },
              { time: "18:40", format: "LUX" }
            ]
          }, 
          
          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          },
          
          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          }
        ]
      },

      {
        date: Date.new(2026, 5, 21),
        movies: [
          # ФІЛЬМИ НА 21 ЧИСЛО

          {
            title: "Інтерстеллар",
            genre: "Фантастика, драма",
            duration: "2 год 49 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
            sessions: [
              { time: "16:00", format: "2D" },
              { time: "20:30", format: "LUX" }
            ]
          }
        ]
      },

      {
        date: Date.new(2026, 5, 22),
        movies: [
          {
            title: "Дюна",
            genre: "Фантастика",
            duration: "2 год 35 хв",
            age: "12+",
            poster: "https://image.tmdb.org/t/p/w500/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
            sessions: [
              { time: "13:00", format: "2D" },
              { time: "19:20", format: "LUX" }
            ]
          }
        ]
      },

      {
        date: Date.new(2026, 5, 23),
        movies: [
          # ФІЛЬМИ НА 23 ЧИСЛО
        ]
      },

      {
        date: Date.new(2026, 5, 24),
        movies: [
          # ФІЛЬМИ НА 24 ЧИСЛО
        ]
      },

      {
        date: Date.new(2026, 5, 25),
        movies: [
          # ФІЛЬМИ НА 25 ЧИСЛО
        ]
      }
    ]
  end
end