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

ActiveRecord::Schema.define(version: 20150521145257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["service_id"], name: "index_categories_on_service_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "ticket_categories", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "category_id"
  end

  add_index "ticket_categories", ["category_id"], name: "index_ticket_categories_on_category_id", using: :btree
  add_index "ticket_categories", ["ticket_id"], name: "index_ticket_categories_on_ticket_id", using: :btree

  create_table "ticket_services", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "service_id"
  end

  add_index "ticket_services", ["service_id"], name: "index_ticket_services_on_service_id", using: :btree
  add_index "ticket_services", ["ticket_id"], name: "index_ticket_services_on_ticket_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.string   "title",                   null: false
    t.text     "description",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",       default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
