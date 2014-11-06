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

ActiveRecord::Schema.define(version: 20141106010216) do

  create_table "captchas", force: true do |t|
    t.string   "captcha_type",             null: false
    t.string   "mobile",                   null: false
    t.integer  "send_count",   default: 0
    t.string   "code",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "captchas", ["captcha_type", "mobile"], name: "index_captchas_on_captcha_type_and_mobile", unique: true, using: :btree

  create_table "cities", force: true do |t|
    t.integer  "province_id", null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "permissions", force: true do |t|
    t.integer  "role_id",         null: false
    t.string   "controller_name"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["role_id"], name: "index_permissions_on_role_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_introductions", force: true do |t|
    t.integer  "school_id",     null: false
    t.string   "short_content"
    t.text     "full_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_introductions", ["school_id"], name: "index_school_introductions_on_school_id", using: :btree

  create_table "schools", force: true do |t|
    t.integer  "province_id",                                               null: false
    t.integer  "city_id",                                                   null: false
    t.string   "name",                                                      null: false
    t.string   "address"
    t.string   "college_type"
    t.string   "telephone"
    t.string   "avatar"
    t.string   "website"
    t.string   "found_year"
    t.string   "zipcode"
    t.string   "affiliate"
    t.decimal  "latitude",         precision: 10, scale: 6, default: 0.0
    t.decimal  "longitude",        precision: 10, scale: 6, default: 0.0
    t.boolean  "is_211",                                    default: false
    t.boolean  "is_985",                                    default: false
    t.boolean  "is_edu_affiliate",                          default: false
    t.boolean  "has_bachelor",                              default: false
    t.boolean  "is_independent",                            default: false
    t.boolean  "is_civilian_run",                           default: false
    t.integer  "key_disciplines",                           default: 0
    t.integer  "master_num",                                default: 0
    t.integer  "phd_num",                                   default: 0
    t.integer  "academician_num",                           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["address"], name: "index_schools_on_address", using: :btree
  add_index "schools", ["city_id"], name: "index_schools_on_city_id", using: :btree
  add_index "schools", ["college_type"], name: "index_schools_on_college_type", using: :btree
  add_index "schools", ["has_bachelor"], name: "index_schools_on_has_bachelor", using: :btree
  add_index "schools", ["is_211"], name: "index_schools_on_is_211", using: :btree
  add_index "schools", ["is_985"], name: "index_schools_on_is_985", using: :btree
  add_index "schools", ["is_edu_affiliate"], name: "index_schools_on_is_edu_affiliate", using: :btree
  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree
  add_index "schools", ["province_id"], name: "index_schools_on_province_id", using: :btree

  create_table "user_devices", force: true do |t|
    t.integer  "user_id"
    t.string   "client_type"
    t.integer  "device_id"
    t.string   "device_name"
    t.string   "device_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_devices", ["client_type"], name: "index_user_devices_on_client_type", using: :btree
  add_index "user_devices", ["device_id"], name: "index_user_devices_on_device_id", using: :btree
  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "user_roles", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                     null: false
    t.string   "email",                    null: false
    t.string   "cellphone",                null: false
    t.string   "display_name"
    t.integer  "sex"
    t.integer  "status",       default: 0
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["cellphone"], name: "index_users_on_cellphone", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
