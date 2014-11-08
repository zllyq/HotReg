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

ActiveRecord::Schema.define(version: 20141108050311) do

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
