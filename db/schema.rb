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

ActiveRecord::Schema.define(version: 20140715001501) do

  create_table "graduation_years", force: true do |t|
    t.integer  "year",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "graduation_years", ["year"], name: "index_graduation_years_on_year", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                                           null: false
    t.string   "crypted_password",                                null: false
    t.string   "salt",                                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "approval_state"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.string   "family_name",                     default: "",    null: false
    t.string   "given_name",                      default: "",    null: false
    t.string   "handle_name",                     default: "",    null: false
    t.date     "birthday",                                        null: false
    t.string   "email_mobile"
    t.boolean  "admin",                           default: false, null: false
    t.integer  "graduation_year_id",              default: 1,     null: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["graduation_year_id"], name: "index_users_on_graduation_year_id"
  add_index "users", ["handle_name"], name: "index_users_on_handle_name", unique: true
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end