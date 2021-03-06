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

ActiveRecord::Schema.define(version: 20140617224816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prospect_card_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "prospect_card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "card_details"
    t.string   "liker_first_name"
    t.string   "liker_last_name"
    t.string   "liker_email"
  end

  create_table "prospect_cards", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "looking_for"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "user_img"
    t.integer  "left_pos"
    t.integer  "top_pos"
  end

  add_index "prospect_cards", ["user_id"], name: "index_prospect_cards_on_user_id", using: :btree

  create_table "recruiter_card_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "recruiter_card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "card_details"
    t.string   "liker_first_name"
    t.string   "liker_last_name"
    t.string   "liker_email"
  end

  create_table "recruiter_cards", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "looking_for"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_img"
    t.integer  "left_pos"
    t.integer  "top_pos"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.text     "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_email"
    t.string   "linkedin_profile_img"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
