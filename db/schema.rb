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

ActiveRecord::Schema.define(version: 20140707201447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "providers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "zip"
    t.binary   "profile_image"
    t.string   "filename"
    t.string   "content_type"
    t.string   "description"
    t.decimal  "rate"
    t.string   "unit"
    t.text     "summary"
    t.string   "honorific"
  end

  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "ratings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.integer  "provider_id"
  end

  add_index "ratings", ["provider_id"], name: "index_ratings_on_provider_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "provider_id"
    t.integer  "rating"
    t.integer  "user_id"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["provider_id"], name: "index_reviews_on_provider_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "zip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
