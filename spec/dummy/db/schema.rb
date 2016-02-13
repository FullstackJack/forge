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

ActiveRecord::Schema.define(version: 20160129223519) do

  create_table "forgecms_categories", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "body",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forgecms_comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "body",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forgecms_post_revisions", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
  end

  create_table "forgecms_posts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "category_id",  limit: 4
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.date     "publish_date"
    t.string   "slug",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "post_id",      limit: 4
  end

  add_index "forgecms_posts", ["post_id"], name: "index_forgecms_posts_on_post_id", using: :btree

  create_table "forgecms_settings", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forgecms_tag_links", force: :cascade do |t|
    t.integer  "tag_id",      limit: 4
    t.integer  "target_id",   limit: 4
    t.string   "target_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "forgecms_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forgecms_users", force: :cascade do |t|
    t.string   "first_name",             limit: 255,   default: "", null: false
    t.string   "last_name",              limit: 255,   default: "", null: false
    t.text     "bio",                    limit: 65535
    t.string   "website",                limit: 255
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role",                   limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "forgecms_users", ["email"], name: "index_forgecms_users_on_email", unique: true, using: :btree
  add_index "forgecms_users", ["reset_password_token"], name: "index_forgecms_users_on_reset_password_token", unique: true, using: :btree

end
