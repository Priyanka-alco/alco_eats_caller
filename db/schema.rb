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

ActiveRecord::Schema.define(version: 20201011094052) do

  create_table "card_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cust_id"
    t.string   "card_number"
    t.string   "expiry_date"
    t.string   "cvc_code"
    t.string   "cardholder_name"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "city_name"
    t.integer  "state_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "country_name"
    t.string   "country_code"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.integer  "country"
    t.integer  "state"
    t.integer  "city"
    t.string   "pincode"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "dob"
    t.date     "anniversary"
  end

  create_table "discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "discount_code"
    t.integer  "no_of_coupon"
    t.date     "valid_from"
    t.date     "valid_to"
    t.float    "minimum_order_value", limit: 24
    t.float    "discount_amount",     limit: 24
    t.boolean  "auto_apply"
    t.boolean  "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.float    "discount_percentage", limit: 24
  end

  create_table "discounts_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "discount_id"
    t.integer  "product_id"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "sku_id"
    t.integer  "quantity"
    t.integer  "discount_id"
    t.integer  "selling_price"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cust_id"
    t.float    "total",        limit: 24
    t.integer  "discount_id"
    t.integer  "seller_id"
    t.integer  "status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "payment_type"
  end

  create_table "paytm_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "phone_number"
    t.integer  "cust_id"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "product_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "sku"
    t.integer  "category"
    t.float    "selling_rice",        limit: 24
    t.float    "cost_price",          limit: 24
    t.float    "gst",                 limit: 24
    t.integer  "discount_id"
    t.float    "discount_amount",     limit: 24
    t.float    "discount_percentage", limit: 24
    t.integer  "quantity"
    t.boolean  "exchange_available"
    t.boolean  "replace"
    t.boolean  "status"
    t.date     "delivery_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "product_name"
    t.string   "description"
    t.string   "image"
    t.float    "over_all_rating",    limit: 24
    t.boolean  "discount_available"
    t.integer  "total_quantity"
    t.boolean  "available"
    t.integer  "vendor_detail_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "state_name"
    t.integer  "country_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
