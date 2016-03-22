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

ActiveRecord::Schema.define(version: 20160321012405) do

  create_table "forge_categories", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forge_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forge_post_revisions", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
  end

  create_table "forge_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id",  default: 0
    t.string   "title"
    t.text     "body"
    t.integer  "status",       default: 0
    t.integer  "visibility",   default: 0
    t.datetime "published_at"
    t.string   "slug"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "post_id"
    t.integer  "published_by"
  end

  add_index "forge_posts", ["post_id"], name: "index_forge_posts_on_post_id"
  add_index "forge_posts", ["slug"], name: "index_forge_posts_on_slug"

  create_table "forge_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forge_tag_links", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "forge_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forge_users", force: :cascade do |t|
    t.string   "first_name",             default: "",      null: false
    t.string   "last_name",              default: "",      null: false
    t.text     "bio"
    t.string   "website"
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.text     "tokens"
  end

  add_index "forge_users", ["confirmation_token"], name: "index_forge_users_on_confirmation_token", unique: true
  add_index "forge_users", ["email"], name: "index_forge_users_on_email", unique: true
  add_index "forge_users", ["reset_password_token"], name: "index_forge_users_on_reset_password_token", unique: true
  add_index "forge_users", ["uid", "provider"], name: "index_forge_users_on_uid_and_provider", unique: true

end
