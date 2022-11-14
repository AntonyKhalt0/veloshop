# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_09_140953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "payment_type", default: "cash"
    t.string "status", default: "create"
    t.float "total_price"
    t.json "products"
    t.bigint "buyer_id", null: false
    t.bigint "seller_id"
    t.bigint "shopping_cart_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
    t.index ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.integer "article", null: false
    t.string "description", null: false
    t.float "price", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "products_shopping_carts", force: :cascade do |t|
    t.bigint "shopping_cart_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_products_shopping_carts_on_product_id"
    t.index ["shopping_cart_id"], name: "index_products_shopping_carts_on_shopping_cart_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_shopping_carts_on_buyer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "phone"
    t.string "address"
    t.boolean "buyer", default: true
    t.boolean "admin", default: false
    t.boolean "seller", default: false
    t.boolean "director", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shopping_cart_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shopping_cart_id"], name: "index_users_on_shopping_cart_id"
  end

  add_foreign_key "orders", "shopping_carts"
  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "orders", "users", column: "seller_id"
  add_foreign_key "products", "categories"
  add_foreign_key "shopping_carts", "users", column: "buyer_id"
  add_foreign_key "users", "shopping_carts"
end
