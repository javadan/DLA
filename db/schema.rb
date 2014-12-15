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

ActiveRecord::Schema.define(version: 20141215201005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approval_votes", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "user_id"
    t.string   "vote"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "comment"
  end

  add_index "approval_votes", ["candidate_id"], name: "index_approval_votes_on_candidate_id", using: :btree
  add_index "approval_votes", ["user_id"], name: "index_approval_votes_on_user_id", using: :btree

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
    t.string   "category"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "fundraiser_comments", force: true do |t|
    t.integer  "fundraiser_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "fundraiser_comments", ["fundraiser_id"], name: "index_fundraiser_comments_on_fundraiser_id", using: :btree
  add_index "fundraiser_comments", ["user_id"], name: "index_fundraiser_comments_on_user_id", using: :btree

  create_table "fundraiser_votes", force: true do |t|
    t.string   "type"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "fundraiser_id"
    t.integer  "user_id"
  end

  add_index "fundraiser_votes", ["fundraiser_id"], name: "index_fundraiser_votes_on_fundraiser_id", using: :btree
  add_index "fundraiser_votes", ["user_id"], name: "index_fundraiser_votes_on_user_id", using: :btree

  create_table "fundraisers", force: true do |t|
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "name"
    t.integer  "user_id"
    t.text     "viability_capital"
    t.text     "viability_description"
    t.text     "viability_participation_event"
    t.text     "viability_participation_logistics"
    t.text     "viability_profit"
    t.text     "viability_risk"
  end

  add_index "fundraisers", ["user_id"], name: "index_fundraisers_on_user_id", using: :btree

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

  create_table "meeting_attendances", force: true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.string   "outcome"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "meeting_attendances", ["meeting_id"], name: "index_meeting_attendances_on_meeting_id", using: :btree
  add_index "meeting_attendances", ["user_id"], name: "index_meeting_attendances_on_user_id", using: :btree

  create_table "meetings", force: true do |t|
    t.datetime "updated_at"
    t.datetime "created_at"
    t.datetime "scheduled_for"
    t.string   "state"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "role"
    t.boolean  "is_new",     default: false
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
    t.boolean  "admin",                    default: false
    t.boolean  "profile_updated",          default: false
    t.boolean  "shamed",                   default: false
    t.string   "email_confirmation_token"
    t.string   "email_confirmed_at"
    t.boolean  "newsletter_subscribed",    default: false
    t.boolean  "approved",                 default: false
  end

  add_index "users", ["email_confirmation_token"], name: "index_users_on_email_confirmation_token", using: :btree

end
