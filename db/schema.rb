# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150726203242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "city"
    t.integer  "votes"
    t.integer  "user_id"
    t.integer  "comedian_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vote_count"
    t.boolean  "show"
  end

  create_table "comedians", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.text     "photo"
    t.text     "bio"
    t.text     "twitter"
    t.text     "facebook"
    t.text     "instagram"
    t.text     "youtube"
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "show_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "role"
    t.string   "podcast"
    t.string   "podcast_title"
  end

  create_table "events", force: :cascade do |t|
    t.string   "date"
    t.string   "time"
    t.string   "location"
    t.string   "venue"
    t.string   "lineup"
    t.string   "tickets_link"
    t.integer  "comedian_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "comedian_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "torf"
  end

  add_index "follows", ["comedian_id"], name: "index_follows_on_comedian_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.string   "phone_number"
    t.integer  "notify_radius"
    t.integer  "comedian_id"
    t.integer  "city_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "role"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "bio"
    t.text     "facebook"
    t.text     "instagram"
    t.text     "youtube"
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "twitter"
    t.string   "podcast"
    t.string   "podcast_title"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "comedian_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "votes", ["city_id"], name: "index_votes_on_city_id", using: :btree
  add_index "votes", ["comedian_id"], name: "index_votes_on_comedian_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "follows", "comedians"
  add_foreign_key "follows", "users"
  add_foreign_key "votes", "cities"
  add_foreign_key "votes", "comedians"
  add_foreign_key "votes", "users"
end
