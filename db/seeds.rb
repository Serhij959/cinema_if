# db/seeds.rb

puts "Start seeding..."

# =========================
# Super admin
# =========================

super_admin_email = "sergijskripnik63@gmail.com"

user = User.find_by(email: super_admin_email)

if user
  user.update!(role: "super_admin")
  puts "Super admin updated: #{super_admin_email}"
else
  User.create!(
    email: super_admin_email,
    password: "password123",
    password_confirmation: "password123",
    role: "super_admin"
  )
  puts "Super admin created: #{super_admin_email}"
end

# =========================
# Halls
# =========================

hall_1 = Hall.find_or_create_by!(name: "Зал 1") do |hall|
  hall.hall_type = "2D"
  hall.rows = 8
  hall.seats_per_row = 12
end

hall_2 = Hall.find_or_create_by!(name: "Зал 2") do |hall|
  hall.hall_type = "3D"
  hall.rows = 7
  hall.seats_per_row = 10
end

hall_3 = Hall.find_or_create_by!(name: "Зал 3") do |hall|
  hall.hall_type = "LUX"
  hall.rows = 6
  hall.seats_per_row = 8
end

# =========================
# Movies
# =========================

movies_data = [
  {
    title: "Дюна",
    title_en: "Dune",
    genre: "фантастика",
    genre_en: "sci-fi",
    duration: "2 год 35 хв",
    duration_en: "2h 35m",
    age: "12+",
    poster: "https://upload.wikimedia.org/wikipedia/en/8/8e/Dune_%282021_film%29.jpg",
    description: "Фантастична історія про боротьбу за пустельну планету Арракіс.",
    description_en: "A sci-fi story about the fight for the desert planet Arrakis."
  },
  {
    title: "Інтерстеллар",
    title_en: "Interstellar",
    genre: "фантастика, драма",
    genre_en: "sci-fi, drama",
    duration: "2 год 49 хв",
    duration_en: "2h 49m",
    age: "12+",
    poster: "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
    description: "Група дослідників вирушає у космос, щоб знайти новий дім для людства.",
    description_en: "A group of explorers travels through space to find a new home for humanity."
  },
  {
    title: "Месники: Фінал",
    title_en: "Avengers: Endgame",
    genre: "фантастика, бойовик",
    genre_en: "sci-fi, action",
    duration: "3 год 1 хв",
    duration_en: "3h 1m",
    age: "12+",
    poster: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg",
    description: "Супергерої об’єднуються для фінальної битви за долю всесвіту.",
    description_en: "Superheroes unite for the final battle for the fate of the universe."
  },
  {
    title: "Дедпул і Росомаха",
    title_en: "Deadpool & Wolverine",
    genre: "бойовик, комедія",
    genre_en: "action, comedy",
    duration: "2 год 7 хв",
    duration_en: "2h 7m",
    age: "16+",
    poster: "https://upload.wikimedia.org/wikipedia/en/4/4c/Deadpool_%26_Wolverine_poster.jpg",
    description: "Дедпул і Росомаха вирушають у небезпечну та іронічну пригоду.",
    description_en: "Deadpool and Wolverine go on a dangerous and ironic adventure."
  },
  {
    title: "Людина-павук: Додому шляху нема",
    title_en: "Spider-Man: No Way Home",
    genre: "фантастика, пригоди",
    genre_en: "sci-fi, adventure",
    duration: "2 год 28 хв",
    duration_en: "2h 28m",
    age: "12+",
    poster: "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg",
    description: "Пітер Паркер стикається з наслідками розкриття своєї особистості.",
    description_en: "Peter Parker faces the consequences of his identity being revealed."
  },
  {
    title: "Джокер",
    title_en: "Joker",
    genre: "драма, трилер",
    genre_en: "drama, thriller",
    duration: "2 год 2 хв",
    duration_en: "2h 2m",
    age: "16+",
    poster: "https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg",
    description: "Історія становлення Артура Флека та його перетворення на Джокера.",
    description_en: "The story of Arthur Fleck and his transformation into Joker."
  },
  {
    title: "Думками навиворіт 2",
    title_en: "Inside Out 2",
    genre: "мультфільм, комедія",
    genre_en: "animation, comedy",
    duration: "1 год 36 хв",
    duration_en: "1h 36m",
    age: "6+",
    poster: "https://upload.wikimedia.org/wikipedia/en/f/f7/Inside_Out_2_poster.jpg",
    description: "Нові емоції з’являються у житті Райлі та змінюють її внутрішній світ.",
    description_en: "New emotions appear in Riley's life and change her inner world."
  },
  {
    title: "Кунг-фу Панда 4",
    title_en: "Kung Fu Panda 4",
    genre: "мультфільм, пригоди",
    genre_en: "animation, adventure",
    duration: "1 год 34 хв",
    duration_en: "1h 34m",
    age: "6+",
    poster: "https://upload.wikimedia.org/wikipedia/en/7/7f/Kung_Fu_Panda_4_poster.jpg",
    description: "По повертається до нових пригод і має знайти наступного Воїна Дракона.",
    description_en: "Po returns for new adventures and must find the next Dragon Warrior."
  },
  {
    title: "Стихії",
    title_en: "Elemental",
    genre: "мультфільм, сімейний",
    genre_en: "animation, family",
    duration: "1 год 41 хв",
    duration_en: "1h 41m",
    age: "6+",
    poster: "https://upload.wikimedia.org/wikipedia/en/4/4f/Elemental_2023_film_poster.jpg",
    description: "У місті стихій зустрічаються вогонь і вода, які відкривають для себе новий світ.",
    description_en: "In a city of elements, fire and water meet and discover a new world."
  }
]

movies = {}

movies_data.each do |data|
  movie = Movie.find_or_initialize_by(title: data[:title])
  movie.update!(data)
  movies[data[:title]] = movie
end

puts "Movies seeded."

# =========================
# Screenings until June 4
# =========================

screenings_data = [
  # 27 травня
  [ "Думками навиворіт 2", hall_1, "2026-05-27", "11:00", "2D", 130 ],
  [ "Кунг-фу Панда 4", hall_2, "2026-05-27", "13:20", "3D", 150 ],
  [ "Дюна", hall_3, "2026-05-27", "18:30", "LUX", 220 ],

  # 28 травня
  [ "Стихії", hall_1, "2026-05-28", "12:10", "2D", 130 ],
  [ "Людина-павук: Додому шляху нема", hall_2, "2026-05-28", "16:40", "3D", 170 ],
  [ "Джокер", hall_3, "2026-05-28", "20:30", "LUX", 220 ],

  # 29 травня
  [ "Кунг-фу Панда 4", hall_1, "2026-05-29", "10:40", "2D", 120 ],
  [ "Месники: Фінал", hall_2, "2026-05-29", "15:30", "3D", 180 ],
  [ "Інтерстеллар", hall_3, "2026-05-29", "19:20", "LUX", 230 ],

  # 30 травня
  [ "Думками навиворіт 2", hall_1, "2026-05-30", "11:30", "2D", 130 ],
  [ "Дедпул і Росомаха", hall_2, "2026-05-30", "17:10", "3D", 190 ],
  [ "Дюна", hall_3, "2026-05-30", "21:00", "LUX", 230 ],

  # 31 травня
  [ "Стихії", hall_1, "2026-05-31", "10:20", "2D", 120 ],
  [ "Людина-павук: Додому шляху нема", hall_2, "2026-05-31", "14:50", "3D", 170 ],
  [ "Месники: Фінал", hall_3, "2026-05-31", "19:00", "LUX", 240 ],

  # 1 червня
  [ "Кунг-фу Панда 4", hall_1, "2026-06-01", "12:00", "2D", 130 ],
  [ "Думками навиворіт 2", hall_2, "2026-06-01", "15:20", "3D", 150 ],
  [ "Інтерстеллар", hall_3, "2026-06-01", "20:10", "LUX", 230 ],

  # 2 червня
  [ "Стихії", hall_1, "2026-06-02", "11:40", "2D", 120 ],
  [ "Дедпул і Росомаха", hall_2, "2026-06-02", "18:20", "3D", 190 ],
  [ "Джокер", hall_3, "2026-06-02", "21:10", "LUX", 220 ],

  # 3 червня
  [ "Думками навиворіт 2", hall_1, "2026-06-03", "10:50", "2D", 130 ],
  [ "Людина-павук: Додому шляху нема", hall_2, "2026-06-03", "16:00", "3D", 170 ],
  [ "Дюна", hall_3, "2026-06-03", "20:00", "LUX", 230 ],

  # 4 червня
  [ "Кунг-фу Панда 4", hall_1, "2026-06-04", "12:30", "2D", 130 ],
  [ "Месники: Фінал", hall_2, "2026-06-04", "17:30", "3D", 180 ],
  [ "Інтерстеллар", hall_3, "2026-06-04", "21:00", "LUX", 230 ]
]

screenings_data.each do |movie_title, hall, date, time, format, price|
  Screening.find_or_create_by!(
    movie: movies[movie_title],
    hall: hall,
    show_date: Date.parse(date),
    show_time: time,
    format: format,
    price: price
  )
end

puts "Screenings seeded."

# =========================
# Announcements
# =========================

announcements_data = [
  {
    title: "Аватар 3",
    title_en: "Avatar 3",
    poster: "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_The_Way_of_Water_poster.jpg",
    release_date: "17.06.2026",
    description: "Новий розділ фантастичної саги Джеймса Кемерона. Скоро у кінотеатрі.",
    description_en: "A new chapter of James Cameron's sci-fi saga. Coming soon."
  },
  {
    title: "Історія іграшок 5",
    title_en: "Toy Story 5",
    poster: "https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg",
    release_date: "25.06.2026",
    description: "Улюблені герої повертаються у новій сімейній пригоді.",
    description_en: "Favorite characters return in a new family adventure."
  },
  {
    title: "Суперсімейка 3",
    title_en: "The Incredibles 3",
    poster: "https://upload.wikimedia.org/wikipedia/en/2/27/The_Incredibles_%282004_animated_feature_film%29.jpg",
    release_date: "02.07.2026",
    description: "Нова пригода родини супергероїв, яка знову рятує світ.",
    description_en: "A new adventure of the superhero family saving the world again."
  }
]

announcements_data.each do |data|
  announcement = Announcement.find_or_initialize_by(title: data[:title])
  announcement.update!(data)
end

puts "Announcements seeded."

# =========================
# Promotions
# =========================

promotions_data = [
  {
    title: "Дитячий квиток",
    title_en: "Kids ticket",
    image: "https://images.unsplash.com/photo-1502139214982-d0ad755818d8",
    description: "Спеціальна ціна на дитячі мультфільми у ранкові години.",
    description_en: "Special price for children's animated movies in the morning.",
    active: true
  },
  {
    title: "Знижка для студентів",
    title_en: "Student discount",
    image: "https://images.unsplash.com/photo-1523580846011-d3a5bc25702b",
    description: "Знижка на квитки для студентів за наявності студентського квитка.",
    description_en: "Discount for students with a valid student ID.",
    active: true
  },
  {
    title: "Сімейний день",
    title_en: "Family day",
    image: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
    description: "Вигідна пропозиція для сімейного перегляду фільмів у вихідні.",
    description_en: "Special offer for family movie watching on weekends.",
    active: true
  }
]

promotions_data.each do |data|
  promotion = Promotion.find_or_initialize_by(title: data[:title])
  promotion.update!(data)
end

puts "Promotions seeded."

puts "Seeding completed!"
