# =========================
# CLEAR OLD DATA
# =========================

Booking.destroy_all if defined?(Booking)
Screening.destroy_all
Movie.destroy_all
Hall.destroy_all

# =========================
# HALLS
# =========================

hall1 = Hall.create!(
  name: "Зал 1",
  rows: 11,
  seats_per_row: 18,
  hall_type: "2D"
)

hall2 = Hall.create!(
  name: "Зал 2",
  rows: 10,
  seats_per_row: 16,
  hall_type: "2D"
)

hall3 = Hall.create!(
  name: "Зал 3",
  rows: 9,
  seats_per_row: 16,
  hall_type: "3D"
)

hall4 = Hall.create!(
  name: "Зал 4",
  rows: 9,
  seats_per_row: 18,
  hall_type: "3D"
)

lux1 = Hall.create!(
  name: "LUX 1",
  rows: 6,
  seats_per_row: 10,
  hall_type: "LUX"
)

lux2 = Hall.create!(
  name: "LUX 2",
  rows: 5,
  seats_per_row: 8,
  hall_type: "LUX"
)

# =========================
# MOVIES
# =========================

dune = Movie.create!(
  title: "Дюна",
  title_en: "Dune",

  genre: "Фантастика",
  genre_en: "Sci-Fi",

  duration: "2 год 35 хв",
  duration_en: "2 h 35 min",

  age: "12+",

  poster: "https://upload.wikimedia.org/wikipedia/ru/thumb/f/f1/%D0%94%D1%8E%D0%BD%D0%B0_%D0%BE%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpg/250px-%D0%94%D1%8E%D0%BD%D0%B0_%D0%BE%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpg",

  description: "Пол Атрейдес вирушає на Арракіс, де починається боротьба за майбутнє його родини.",

  description_en: "Paul Atreides travels to Arrakis where the battle for his family begins."
)

deadpool = Movie.create!(
  title: "Дедпул і Росомаха",
  title_en: "Deadpool & Wolverine",

  genre: "Бойовик, комедія",
  genre_en: "Action, Comedy",

  duration: "2 год 7 хв",
  duration_en: "2 h 7 min",

  age: "16+",

  poster: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",

  description: "Дедпул повертається разом із Росомахою для найшаленішої місії Marvel.",

  description_en: "Deadpool returns with Wolverine for a crazy Marvel mission."
)

interstellar = Movie.create!(
  title: "Інтерстеллар",
  title_en: "Interstellar",

  genre: "Фантастика, драма",
  genre_en: "Sci-Fi, Drama",

  duration: "2 год 49 хв",
  duration_en: "2 h 49 min",

  age: "12+",

  poster: "https://s3.vcdn.biz/static/f/6755876391/image.jpg",

  description: "Група дослідників вирушає у космос, щоб знайти новий дім для людства.",

  description_en: "A team of explorers travels through space to save humanity."
)

avengers = Movie.create!(
  title: "Месники: Фінал",
  title_en: "Avengers: Endgame",

  genre: "Фантастика, бойовик",
  genre_en: "Sci-Fi, Action",

  duration: "3 год 1 хв",
  duration_en: "3 h 1 min",

  age: "12+",

  poster: "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",

  description: "Месники збираються разом для фінальної битви проти Таноса.",

  description_en: "The Avengers reunite for the final battle against Thanos."
)

matrix = Movie.create!(
  title: "Матриця",
  title_en: "The Matrix",

  genre: "Фантастика, бойовик",
  genre_en: "Sci-Fi, Action",

  duration: "2 год 16 хв",
  duration_en: "2 h 16 min",

  age: "16+",

  poster: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",

  description: "Нео дізнається, що світ навколо нього є компʼютерною симуляцією.",

  description_en: "Neo discovers that the world around him is a computer simulation."
)

joker = Movie.create!(
  title: "Джокер",
  title_en: "Joker",

  genre: "Драма, трилер",
  genre_en: "Drama, Thriller",

  duration: "2 год 2 хв",
  duration_en: "2 h 2 min",

  age: "16+",

  poster: "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",

  description: "Історія Артура Флека, який поступово перетворюється на Джокера.",

  description_en: "The story of Arthur Fleck and his transformation into Joker."
)

spiderman = Movie.create!(
  title: "Людина-павук: Додому шляху нема",
  title_en: "Spider-Man: No Way Home",

  genre: "Фантастика, пригоди",
  genre_en: "Sci-Fi, Adventure",

  duration: "2 год 28 хв",
  duration_en: "2 h 28 min",

  age: "12+",

  poster: "https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",

  description: "Пітер Паркер стикається з наслідками розкриття своєї особистості.",

  description_en: "Peter Parker faces the consequences of his identity being revealed."
)

# =========================
# TODAY SCREENINGS
# =========================

Screening.create!(
  movie: dune,
  hall: hall1,
  show_date: Date.today,
  show_time: "13:00",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: dune,
  hall: hall3,
  show_date: Date.today,
  show_time: "16:40",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: dune,
  hall: lux1,
  show_date: Date.today,
  show_time: "19:20",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: deadpool,
  hall: hall1,
  show_date: Date.today,
  show_time: "12:30",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: deadpool,
  hall: hall3,
  show_date: Date.today,
  show_time: "15:10",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: deadpool,
  hall: hall4,
  show_date: Date.today,
  show_time: "18:00",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: deadpool,
  hall: lux1,
  show_date: Date.today,
  show_time: "20:50",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: interstellar,
  hall: hall2,
  show_date: Date.today,
  show_time: "11:20",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: interstellar,
  hall: hall4,
  show_date: Date.today,
  show_time: "17:40",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: interstellar,
  hall: lux2,
  show_date: Date.today,
  show_time: "21:30",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: avengers,
  hall: hall2,
  show_date: Date.today,
  show_time: "14:10",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: avengers,
  hall: hall4,
  show_date: Date.today,
  show_time: "19:00",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: matrix,
  hall: hall1,
  show_date: Date.today,
  show_time: "10:30",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: matrix,
  hall: hall3,
  show_date: Date.today,
  show_time: "18:20",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: spiderman,
  hall: hall1,
  show_date: Date.today,
  show_time: "11:50",
  format: "2D",
  price: 150
)

# =========================
# TOMORROW SCREENINGS
# =========================

Screening.create!(
  movie: dune,
  hall: hall2,
  show_date: Date.tomorrow,
  show_time: "14:30",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: deadpool,
  hall: hall4,
  show_date: Date.tomorrow,
  show_time: "18:50",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: matrix,
  hall: lux1,
  show_date: Date.tomorrow,
  show_time: "21:00",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: joker,
  hall: hall2,
  show_date: Date.tomorrow,
  show_time: "13:40",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: joker,
  hall: lux2,
  show_date: Date.tomorrow,
  show_time: "20:30",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: spiderman,
  hall: hall3,
  show_date: Date.tomorrow,
  show_time: "16:20",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: avengers,
  hall: hall1,
  show_date: Date.tomorrow,
  show_time: "12:10",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: interstellar,
  hall: hall4,
  show_date: Date.tomorrow,
  show_time: "19:30",
  format: "3D",
  price: 180
)

# =========================
# DAY AFTER TOMORROW SCREENINGS
# =========================

Screening.create!(
  movie: joker,
  hall: hall4,
  show_date: Date.today + 2.days,
  show_time: "17:10",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: spiderman,
  hall: lux1,
  show_date: Date.today + 2.days,
  show_time: "19:40",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: interstellar,
  hall: lux2,
  show_date: Date.today + 2.days,
  show_time: "21:20",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: avengers,
  hall: hall1,
  show_date: Date.today + 2.days,
  show_time: "15:30",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: dune,
  hall: hall3,
  show_date: Date.today + 2.days,
  show_time: "12:20",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: deadpool,
  hall: lux1,
  show_date: Date.today + 2.days,
  show_time: "20:10",
  format: "LUX",
  price: 250
)

# =========================
# EXTRA DAYS
# =========================

Screening.create!(
  movie: matrix,
  hall: hall2,
  show_date: Date.today + 3.days,
  show_time: "15:00",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: joker,
  hall: hall3,
  show_date: Date.today + 3.days,
  show_time: "18:30",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: spiderman,
  hall: lux2,
  show_date: Date.today + 3.days,
  show_time: "21:00",
  format: "LUX",
  price: 250
)

Screening.create!(
  movie: interstellar,
  hall: hall1,
  show_date: Date.today + 4.days,
  show_time: "13:20",
  format: "2D",
  price: 150
)

Screening.create!(
  movie: avengers,
  hall: hall4,
  show_date: Date.today + 4.days,
  show_time: "19:10",
  format: "3D",
  price: 180
)

Screening.create!(
  movie: dune,
  hall: lux1,
  show_date: Date.today + 4.days,
  show_time: "21:40",
  format: "LUX",
  price: 250
)

puts "Seeds created successfully!"
puts "Movies: #{Movie.count}"
puts "Halls: #{Hall.count}"
puts "Screenings: #{Screening.count}"