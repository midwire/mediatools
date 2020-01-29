# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_29_041053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.boolean "adult"
    t.integer "budget"
    t.string "homepage"
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "original_language"
    t.string "original_title"
    t.text "overview"
    t.float "popularity"
    t.date "release_date"
    t.integer "revenue"
    t.integer "runtime"
    t.string "status"
    t.string "tagline"
    t.string "title"
    t.boolean "video"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "filepath"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adult"], name: "index_movies_on_adult"
    t.index ["imdb_id"], name: "index_movies_on_imdb_id", unique: true
    t.index ["popularity"], name: "index_movies_on_popularity"
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["runtime"], name: "index_movies_on_runtime"
    t.index ["status"], name: "index_movies_on_status"
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id", unique: true
    t.index ["video"], name: "index_movies_on_video"
    t.index ["vote_average"], name: "index_movies_on_vote_average"
    t.index ["vote_count"], name: "index_movies_on_vote_count"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.date "first_air_date"
    t.string "homepage"
    t.integer "tmdb_id"
    t.boolean "in_production"
    t.date "last_air_date"
    t.string "name"
    t.date "next_episode_to_air"
    t.integer "number_of_episodes"
    t.integer "number_of_seasons"
    t.string "origin_country"
    t.string "original_language"
    t.string "original_name"
    t.text "overview"
    t.float "popularity"
    t.string "status"
    t.string "type"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "filepath"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_air_date"], name: "index_tv_shows_on_first_air_date"
    t.index ["in_production"], name: "index_tv_shows_on_in_production"
    t.index ["last_air_date"], name: "index_tv_shows_on_last_air_date"
    t.index ["name"], name: "index_tv_shows_on_name"
    t.index ["next_episode_to_air"], name: "index_tv_shows_on_next_episode_to_air"
    t.index ["tmdb_id"], name: "index_tv_shows_on_tmdb_id", unique: true
  end

end
