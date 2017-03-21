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

ActiveRecord::Schema.define(version: 20170321144236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bookmate_book_categories", force: :cascade do |t|
    t.integer  "bookmate_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["bookmate_id"], name: "index_bookmate_book_categories_on_bookmate_id", using: :btree
  end

  create_table "bookmates", force: :cascade do |t|
    t.text     "description"
    t.boolean  "deliver_by_hand"
    t.boolean  "home_delivery"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_bookmates_on_user_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "author"
    t.text     "author_bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loved_books", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_loved_books_on_book_id", using: :btree
    t.index ["user_id"], name: "index_loved_books_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.text     "review"
    t.float    "rating"
    t.string   "delivery_type"
    t.string   "order_status"
    t.string   "delivery_status"
    t.integer  "bookmate_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bookmate_id"], name: "index_orders_on_bookmate_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "selling_books", force: :cascade do |t|
    t.integer  "book_id"
    t.text     "personalized_comment"
    t.float    "price"
    t.string   "condition"
    t.boolean  "favorite_book"
    t.boolean  "sold"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "bookmate_book_category_id"
    t.index ["book_id"], name: "index_selling_books_on_book_id", using: :btree
    t.index ["bookmate_book_category_id"], name: "index_selling_books_on_bookmate_book_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookmate_book_categories", "bookmates"
  add_foreign_key "bookmates", "users"
  add_foreign_key "loved_books", "books"
  add_foreign_key "loved_books", "users"
  add_foreign_key "orders", "bookmates"
  add_foreign_key "orders", "users"
  add_foreign_key "selling_books", "books"
end
