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

ActiveRecord::Schema.define(version: 20151007200955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "featurings", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "featurings", ["feature_id"], name: "index_featurings_on_feature_id", using: :btree
  add_index "featurings", ["listing_id"], name: "index_featurings_on_listing_id", using: :btree

  create_table "feed_entries", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.datetime "published_date"
    t.string   "guid"
    t.string   "image_craigslist"
    t.string   "price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "description"
    t.string   "address"
    t.string   "price"
    t.string   "postal"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "featurings", "features"
  add_foreign_key "featurings", "listings"
  add_foreign_key "listings", "users"
end
