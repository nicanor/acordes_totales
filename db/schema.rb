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

ActiveRecord::Schema.define(version: 20150304222052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "bio"
    t.string   "bio_source"
    t.string   "photo_uid"
    t.string   "photo_name"
    t.boolean  "active",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visits_count", default: 0
    t.integer  "tabs_count",   default: 0
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tab_id"
    t.integer  "artist_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["artist_id"], name: "index_favorites_on_artist_id", using: :btree
  add_index "favorites", ["tab_id"], name: "index_favorites_on_tab_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "protected",        default: false
    t.string   "old_slug"
    t.date     "publication_date"
  end

  create_table "tabs", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "tab_type",                             default: "chord"
    t.text     "content"
    t.string   "source"
    t.integer  "artist_id"
    t.boolean  "active",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visits_count",                         default: 0
    t.decimal  "ranking",      precision: 4, scale: 2, default: 0.0
    t.integer  "votes_count",                          default: 0
    t.integer  "user_id"
    t.string   "old_slug"
    t.boolean  "revised",                              default: false
  end

  add_index "tabs", ["artist_id"], name: "index_tabs_on_artist_id", using: :btree
  add_index "tabs", ["user_id"], name: "index_tabs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "visits_count",                    default: 0
    t.string   "nationality"
    t.date     "birth_date"
    t.string   "photo_uid"
    t.string   "photo_name"
    t.text     "about"
    t.string   "slug"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "visits", force: :cascade do |t|
    t.integer  "tab_id"
    t.integer  "artist_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["artist_id"], name: "index_visits_on_artist_id", using: :btree
  add_index "visits", ["tab_id"], name: "index_visits_on_tab_id", using: :btree
  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "tab_id"
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["tab_id"], name: "index_votes_on_tab_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
