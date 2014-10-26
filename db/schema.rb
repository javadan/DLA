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

ActiveRecord::Schema.define(version: 20141011175357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrolments", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "role",       limit: 255, default: "member"
    t.boolean  "approved",               default: false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "enrolments", ["team_id"], name: "index_enrolments_on_team_id", using: :btree
  add_index "enrolments", ["user_id"], name: "index_enrolments_on_user_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.text     "comments"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "ab_appraisal"
    t.text     "ab_best_moment"
    t.text     "dla_negatives"
    t.text     "dla_what_enhanced_your_experience"
    t.text     "dla_your_contribution"
    t.text     "body"
    t.string   "type"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "goal_users", force: true do |t|
    t.integer  "goal_id"
    t.integer  "user_id"
    t.string   "completed_at"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "goal_users", ["goal_id"], name: "index_goal_users_on_goal_id", using: :btree
  add_index "goal_users", ["user_id"], name: "index_goal_users_on_user_id", using: :btree

  create_table "goals", force: true do |t|
    t.string   "type"
    t.datetime "deadline"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "goals", ["type"], name: "index_goals_on_type", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name",       limit: 255
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "role"
    t.boolean  "is_new",                 default: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.string   "email",                    limit: 255
    t.string   "fb_uid",                   limit: 255
    t.string   "fb_username",              limit: 255
    t.string   "fb_token",                 limit: 255
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "admin",                                default: false
    t.boolean  "profile_updated",                      default: false
    t.boolean  "shamed",                               default: false
    t.string   "email_confirmation_token"
    t.string   "email_confirmed_at"
  end

  add_index "users", ["email_confirmation_token"], name: "index_users_on_email_confirmation_token", using: :btree

end
