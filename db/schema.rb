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

ActiveRecord::Schema.define(version: 20141108072653) do

  create_table "cities", force: true do |t|
    t.integer "code"
    t.string  "name",         null: false
    t.integer "provinces_id"
  end

  create_table "grades", force: true do |t|
    t.integer "code"
    t.string  "name", null: false
  end

  create_table "hospitals", force: true do |t|
    t.string   "name",                      null: false
    t.integer  "provinces_id"
    t.string   "provinces_name", limit: 31
    t.integer  "cities_id"
    t.string   "cities_name",    limit: 31
    t.string   "address",                   null: false
    t.integer  "grades_id"
    t.string   "grades_name",    limit: 31
    t.integer  "majors_id"
    t.string   "majors_name",    limit: 31
    t.string   "phone"
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "majors", force: true do |t|
    t.integer "code"
    t.string  "name",         limit: 31, null: false
    t.text    "introduction"
  end

  create_table "provinces", force: true do |t|
    t.integer "code"
    t.string  "name", null: false
  end

  create_table "departments", force: true do |t|
    t.integer  "hospitals_id"
    t.string   "ids"
    t.string   "name"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "description"
    t.string   "type"
    t.float    "price",              limit: 24
    t.string   "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "{:index=>false}_id"
  end

  create_table "hospitals", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "grade"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hospitals", ["name"], name: "index_hospitals_on_name", using: :btree

  create_table "orders", force: true do |t|
    t.integer "status"
    t.float   "payment", limit: 24
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "unique"
    t.string   "passwd",     limit: 32
    t.integer  "type",       limit: 1,  default: 1
    t.string   "name"
    t.string   "id_card",    limit: 18
    t.string   "phone",      limit: 11
    t.string   "email"
    t.integer  "status",     limit: 1,  default: 0
    t.integer  "point",      limit: 1,  default: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
