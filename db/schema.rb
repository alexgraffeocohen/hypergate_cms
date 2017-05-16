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

ActiveRecord::Schema.define(version: 20170516014045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "encounters", force: :cascade do |t|
    t.integer  "category_id",                       null: false
    t.string   "description",                       null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "starting_event_id"
    t.boolean  "standalone",        default: true,  null: false
    t.boolean  "published",         default: false, null: false
    t.string   "title"
  end

  create_table "event_results", force: :cascade do |t|
    t.integer  "event_id",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "amount",         default: 0, null: false
    t.integer  "ship_effect_id",             null: false
  end

  add_index "event_results", ["event_id"], name: "index_event_results_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "description",                     null: false
    t.integer  "encounter_id",                    null: false
    t.integer  "next_encounter_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "item_id"
    t.integer  "ship_module_id"
    t.integer  "item_role_requirement_id"
    t.integer  "ship_module_role_requirement_id"
  end

  add_index "events", ["encounter_id"], name: "index_events_on_encounter_id", using: :btree
  add_index "events", ["next_encounter_id"], name: "index_events_on_next_encounter_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role_id",    null: false
  end

  add_index "items", ["role_id"], name: "index_items_on_role_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.text     "text",             null: false
    t.integer  "order",            null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "event_id",         null: false
    t.integer  "success_event_id"
    t.integer  "failure_event_id"
    t.integer  "required_role_id"
    t.integer  "skill_check_id"
  end

  add_index "options", ["event_id"], name: "index_options_on_event_id", using: :btree
  add_index "options", ["skill_check_id"], name: "index_options_on_skill_check_id", using: :btree

  create_table "response_skill_checks", force: :cascade do |t|
    t.text     "success_text"
    t.text     "failure_text"
    t.integer  "response_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "option_id",    null: false
  end

  add_index "response_skill_checks", ["option_id"], name: "index_response_skill_checks_on_option_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string   "text",       null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id",   null: false
  end

  add_index "responses", ["role_id"], name: "index_responses_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_effects", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_modules", force: :cascade do |t|
    t.string   "name",                            null: false
    t.boolean  "starting_module", default: false, null: false
    t.integer  "role_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "ship_modules", ["role_id"], name: "index_ship_modules_on_role_id", using: :btree

  create_table "skill_checks", force: :cascade do |t|
    t.integer  "role_id",     null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "difficulty",  null: false
  end

  add_index "skill_checks", ["role_id"], name: "index_skill_checks_on_role_id", using: :btree

  add_foreign_key "encounters", "events", column: "starting_event_id"
  add_foreign_key "event_results", "events", on_delete: :cascade
  add_foreign_key "events", "encounters"
  add_foreign_key "events", "encounters", column: "next_encounter_id"
  add_foreign_key "items", "roles"
  add_foreign_key "options", "events"
  add_foreign_key "options", "events", column: "failure_event_id"
  add_foreign_key "options", "events", column: "success_event_id"
  add_foreign_key "options", "roles", column: "required_role_id"
  add_foreign_key "options", "skill_checks"
  add_foreign_key "response_skill_checks", "options"
  add_foreign_key "responses", "events"
  add_foreign_key "responses", "roles"
  add_foreign_key "ship_modules", "roles"
  add_foreign_key "skill_checks", "roles"
end
