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

ActiveRecord::Schema.define(version: 20140430203247) do

  create_table "bookings", force: true do |t|
    t.date    "day",       null: false
    t.integer "time",      null: false
    t.integer "user_id",   null: false
    t.string  "equipment", null: false
  end

  add_index "bookings", ["day", "time", "equipment"], name: "index_bookings_on_day_and_time_and_equipment", unique: true

  create_table "labs", force: true do |t|
    t.string   "institution"
    t.string   "city"
    t.string   "lab_name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labs", ["lab_name"], name: "index_labs_on_lab_name"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "orders", force: true do |t|
    t.string   "order_name"
    t.string   "order_number"
    t.string   "order_size"
    t.decimal  "order_price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_supplier"
    t.string   "notes"
    t.boolean  "order_status"
  end

  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"

  create_table "protocols", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public_contact", default: false
  end

  add_index "protocols", ["user_id", "created_at"], name: "index_protocols_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                default: false
    t.boolean  "public_contact",       default: false
    t.text     "research_title",       default: " "
    t.text     "research_description", default: " "
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
