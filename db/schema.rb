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

ActiveRecord::Schema.define(version: 20140131141539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrolments", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "role",       default: "member"
    t.boolean  "approved",   default: false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "enrolments", ["team_id"], name: "index_enrolments_on_team_id", using: :btree
  add_index "enrolments", ["user_id"], name: "index_enrolments_on_user_id", using: :btree

  create_table "shames", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "shames", ["group_id"], name: "index_shames_on_group_id", using: :btree
  add_index "shames", ["user_id"], name: "index_shames_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "role"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "fb_uid"
    t.string   "fb_username"
    t.string   "fb_token"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "admin",           default: false
    t.boolean  "profile_updated", default: false
    t.boolean  "shamed",          default: false
  end

end
