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

ActiveRecord::Schema.define(version: 20130923025912) do

  create_table "admin_dictionaries", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.text     "description"
    t.string   "file"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["employee_id"], name: "index_attachments_on_employee_id", using: :btree

  create_table "checks", force: true do |t|
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.integer  "employee_id"
    t.integer  "level"
    t.string   "institution"
    t.string   "discipline"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "passport"
    t.string   "telephone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "employee_id"
    t.string   "company"
    t.string   "title"
    t.date     "from"
    t.date     "to"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helps", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "employee_id"
    t.integer  "group_id"
    t.integer  "salary"
    t.integer  "status"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "user_id"
    t.integer  "level"
    t.string   "tag"
    t.text     "msg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifictions", force: true do |t|
    t.integer  "user_id"
    t.integer  "sender"
    t.text     "msg"
    t.boolean  "unread"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifictions", ["user_id"], name: "index_notifictions_on_user_id", using: :btree

  create_table "performances", force: true do |t|
    t.integer  "employee_id"
    t.integer  "number"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trains", force: true do |t|
    t.string   "name"
    t.integer  "employee_id"
    t.string   "keynote"
    t.datetime "date"
    t.integer  "duration"
    t.string   "address"
    t.boolean  "must"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "admin"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
