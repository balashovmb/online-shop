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

ActiveRecord::Schema.define(version: 20190611171927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "item_number", null: false
    t.string   "name",        null: false
    t.integer  "weight",      null: false
    t.integer  "size",        null: false
    t.string   "color",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products_shops", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shop_id"
    t.float    "cost"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products_shops", ["shop_id", "product_id"], name: "index_products_shops_on_shop_id_and_product_id", unique: true, using: :btree
  add_index "products_shops", ["shop_id"], name: "index_products_shops_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.string   "subway"
    t.integer  "city_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shops", ["city_id"], name: "index_shops_on_city_id", using: :btree

end
