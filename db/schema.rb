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

ActiveRecord::Schema.define(version: 20160114123223) do

  create_table "addresses", force: :cascade do |t|
    t.string   "province",   limit: 255
    t.string   "city",       limit: 255
    t.string   "region",     limit: 255
    t.string   "detail",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "adverts", force: :cascade do |t|
    t.string   "ads_image",  limit: 255
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "adverts", ["product_id"], name: "index_adverts_on_product_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hot_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url",         limit: 255
    t.string   "target_type", limit: 255
    t.integer  "target_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "state",         limit: 4
    t.string   "phone_num",     limit: 255
    t.string   "receive_name",  limit: 255
    t.datetime "delivery_time"
    t.datetime "complete_time"
    t.string   "products",      limit: 255
    t.integer  "address_id",    limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "state",           limit: 4
    t.string   "image",           limit: 255
    t.string   "unit",            limit: 255
    t.integer  "stock_num",       limit: 4
    t.float    "price",           limit: 24
    t.float    "old_price",       limit: 24
    t.integer  "sub_category_id", limit: 4
    t.integer  "hot_category_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "products", ["hot_category_id"], name: "index_products_on_hot_category_id", using: :btree
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "desc",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_id",        limit: 255
    t.string   "user_name",      limit: 255
    t.string   "head_portrait",  limit: 255
    t.integer  "identification", limit: 4,   default: 0
    t.string   "password",       limit: 255
    t.string   "token",          limit: 255
    t.string   "phone_num",      limit: 255
    t.string   "rand",           limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "adverts", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "hot_categories"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "sub_categories", "categories"
end
