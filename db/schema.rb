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

ActiveRecord::Schema.define(version: 20150312113105) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
    t.text     "notes"
    t.string   "file"
  end

  create_table "answers_files", force: true do |t|
    t.integer  "answer_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: true do |t|
    t.integer  "checklist_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", force: true do |t|
    t.string   "report_type"
    t.string   "your_name"
    t.string   "job_title"
    t.date     "injury_date"
    t.time     "injury_time"
    t.string   "witnesses"
    t.string   "location"
    t.string   "circumstances"
    t.string   "event_discription"
    t.string   "injuries_type"
    t.integer  "project_id"
    t.integer  "downloaded"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.boolean  "cn",                          default: false
    t.string   "ppe_used"
    t.string   "medical_assistance_provided"
  end

  create_table "incidents_files", force: true do |t|
    t.integer  "incident_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "role"
    t.integer  "user_id"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobhazards", force: true do |t|
    t.string   "sow"
    t.string   "criticalsteps"
    t.string   "situations"
    t.string   "worsthappen"
    t.string   "defenses"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.integer  "project_id"
    t.integer  "downloaded"
  end

  create_table "jobhazards_files", force: true do |t|
    t.integer  "jobhazard_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_info"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "questions", force: true do |t|
    t.text     "body"
    t.text     "body_es"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "submit"
    t.boolean  "submitted",   default: false
    t.integer  "category_id"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tokens", force: true do |t|
    t.string   "api"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "client_id"
    t.string   "company"
    t.string   "phone"
    t.string   "address"
    t.boolean  "allow_web_access",       default: true, null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
