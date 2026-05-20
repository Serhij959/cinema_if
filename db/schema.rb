# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_20_174027) do
  create_table "halls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "hall_type"
    t.string "name"
    t.integer "rows"
    t.integer "seats_per_row"
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "age"
    t.datetime "created_at", null: false
    t.text "description"
    t.text "description_en"
    t.string "duration"
    t.string "duration_en"
    t.string "genre"
    t.string "genre_en"
    t.string "poster"
    t.string "title"
    t.string "title_en"
    t.datetime "updated_at", null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "format"
    t.integer "hall_id", null: false
    t.integer "movie_id", null: false
    t.integer "price"
    t.date "show_date"
    t.string "show_time"
    t.datetime "updated_at", null: false
    t.index ["hall_id"], name: "index_screenings_on_hall_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "screenings", "halls"
  add_foreign_key "screenings", "movies"
end
