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

ActiveRecord::Schema.define(version: 20141114103505) do

  create_table "episodes", force: true do |t|
    t.string   "name"
    t.text     "video_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "series_id"
    t.string   "sub_status"
    t.integer  "view_count", default: 0, null: false
  end

  add_index "episodes", ["slug"], name: "index_episodes_on_slug", unique: true

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "reports", force: true do |t|
    t.string   "problem"
    t.text     "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "episode_id"
    t.string   "email"
  end

  create_table "series", force: true do |t|
    t.string   "name"
    t.text     "synopsis"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.date     "date_aired"
    t.integer  "view_count",         default: 0, null: false
  end

  add_index "series", ["slug"], name: "index_series_on_slug", unique: true

end