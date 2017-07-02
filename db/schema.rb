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

ActiveRecord::Schema.define(version: 20170701025520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

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
