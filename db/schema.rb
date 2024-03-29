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

ActiveRecord::Schema.define(version: 20160719004604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ancestry"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "ancestry_depth",  default: 0
  end

  add_index "admins", ["ancestry"], name: "index_admins_on_ancestry", using: :btree

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "expires_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "event"
    t.string   "people"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image"
    t.boolean  "image_processing", default: false, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "media"
    t.string   "title"
    t.text     "description"
    t.string   "poster"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "content_type"
    t.string   "media_tmp"
    t.boolean  "media_processing", default: false, null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
