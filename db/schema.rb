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

ActiveRecord::Schema.define(version: 20150223094423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "continents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "school_seasons", force: true do |t|
    t.string   "collection"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_seasons", ["school_id"], name: "index_school_seasons_on_school_id", using: :btree

  create_table "schools", force: true do |t|
    t.integer  "spot_id"
    t.integer  "sports"
    t.string   "name"
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.string   "link"
    t.integer  "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree
  add_index "schools", ["spot_id"], name: "index_schools_on_spot_id", using: :btree

  create_table "seasons", force: true do |t|
    t.integer  "jan",        limit: 2
    t.integer  "feb",        limit: 2
    t.integer  "mar",        limit: 2
    t.integer  "apr",        limit: 2
    t.integer  "may",        limit: 2
    t.integer  "jun",        limit: 2
    t.integer  "jul",        limit: 2
    t.integer  "aug",        limit: 2
    t.integer  "sep",        limit: 2
    t.integer  "oct",        limit: 2
    t.integer  "nov",        limit: 2
    t.integer  "dec",        limit: 2
    t.integer  "sport_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"], name: "index_seasons_on_months", using: :btree
  add_index "seasons", ["sport_id"], name: "index_seasons_on_sport_id", using: :btree
  add_index "seasons", ["spot_id"], name: "index_seasons_on_spot_id", using: :btree

  create_table "sports", force: true do |t|
    t.string "name"
  end

  create_table "sports_spots", id: false, force: true do |t|
    t.integer "spot_id"
    t.integer "sport_id"
  end

  add_index "sports_spots", ["sport_id"], name: "index_sports_spots_on_sport_id", using: :btree
  add_index "sports_spots", ["spot_id", "sport_id"], name: "index_sports_spots_on_spot_id_and_sport_id", unique: true, using: :btree
  add_index "sports_spots", ["spot_id"], name: "index_sports_spots_on_spot_id", using: :btree

  create_table "spot_seasons", force: true do |t|
    t.string   "collection"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spot_seasons", ["spot_id"], name: "index_spot_seasons_on_spot_id", using: :btree

  create_table "spots", force: true do |t|
    t.string   "name"
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spots", ["name"], name: "index_spots_on_name", using: :btree

end
