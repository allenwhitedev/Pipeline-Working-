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

ActiveRecord::Schema.define(version: 20141121015123) do

  create_table "devise_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devise_users", ["email"], name: "index_devise_users_on_email", unique: true
  add_index "devise_users", ["reset_password_token"], name: "index_devise_users_on_reset_password_token", unique: true

  create_table "eu_rels", force: true do |t|
    t.integer  "attender_id"
    t.integer  "attended_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eu_rels", ["attended_id"], name: "index_eu_rels_on_attended_id"
  add_index "eu_rels", ["attender_id", "attended_id"], name: "index_eu_rels_on_attender_id_and_attended_id", unique: true
  add_index "eu_rels", ["attender_id"], name: "index_eu_rels_on_attender_id"

  create_table "events", force: true do |t|
    t.string   "checkincode"
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "points"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "events", ["end_time"], name: "index_events_on_end_time"
  add_index "events", ["start_time"], name: "index_events_on_start_time"
  add_index "events", ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"

  create_table "oe_rels", force: true do |t|
    t.integer  "attender_id"
    t.integer  "attended_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oe_rels", ["attended_id"], name: "index_oe_rels_on_attended_id"
  add_index "oe_rels", ["attender_id", "attended_id"], name: "index_oe_rels_on_attender_id_and_attended_id", unique: true
  add_index "oe_rels", ["attender_id"], name: "index_oe_rels_on_attender_id"

  create_table "organizations", force: true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name"
  add_index "organizations", ["user_id", "created_at"], name: "index_organizations_on_user_id_and_created_at"

  create_table "ou_rels", force: true do |t|
    t.integer  "joiner_id"
    t.integer  "joined_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gleader",     default: false
    t.boolean  "second_rank", default: false
    t.boolean  "third_rank",  default: false
    t.boolean  "fourth_rank", default: false
    t.boolean  "fifth_rank",  default: false
  end

  add_index "ou_rels", ["gleader"], name: "index_ou_rels_on_gleader"
  add_index "ou_rels", ["joined_id"], name: "index_ou_rels_on_joined_id"
  add_index "ou_rels", ["joiner_id", "joined_id"], name: "index_ou_rels_on_joiner_id_and_joined_id", unique: true
  add_index "ou_rels", ["joiner_id"], name: "index_ou_rels_on_joiner_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.boolean  "moderator",              default: false
    t.integer  "total_points",           default: 0
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
