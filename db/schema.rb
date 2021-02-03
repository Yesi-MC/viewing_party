# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_02_220855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "watch_party_id"
    t.bigint "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitee_id"], name: "index_guests_on_invitee_id"
    t.index ["watch_party_id"], name: "index_guests_on_watch_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  create_table "viewing_parties", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.string "movie_title"
    t.string "duration"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_viewing_parties_on_user_id"
  end

  create_table "watch_parties", force: :cascade do |t|
    t.string "movie_title"
    t.string "date"
    t.string "time"
    t.integer "duration"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watch_parties_on_user_id"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "guests", "watch_parties"
  add_foreign_key "viewing_parties", "users"
  add_foreign_key "watch_parties", "users"
end
