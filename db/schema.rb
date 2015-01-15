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

ActiveRecord::Schema.define(version: 20150114214844) do

  create_table "cuisines", force: true do |t|
    t.string   "name"
    t.string   "recipe"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "cuisines_tags", force: true do |t|
    t.integer  "cuisine_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuisines_tags", ["cuisine_id"], name: "index_cuisines_tags_on_cuisine_id"
  add_index "cuisines_tags", ["tag_id"], name: "index_cuisines_tags_on_tag_id"

  create_table "streaterie_locs", force: true do |t|
    t.string   "cuisine"
    t.string   "recipe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
