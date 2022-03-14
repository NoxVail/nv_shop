# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_14_111606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "funnels", force: :cascade do |t|
    t.string "name"
    t.jsonb "data"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_funnels_on_offer_id"
    t.index ["shop_id"], name: "index_funnels_on_shop_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "shopify_id"
    t.string "src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.index ["owner_type", "owner_id"], name: "index_images_on_owner"
  end

  create_table "offers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "funnel_id"
    t.bigint "product_id"
    t.bigint "setting_id"
    t.index ["funnel_id"], name: "index_offers_on_funnel_id"
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["setting_id"], name: "index_offers_on_setting_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "shopify_id"
    t.string "title"
    t.string "description"
    t.string "vendor"
    t.string "product_type"
    t.string "handle"
    t.string "published_at"
    t.string "template_suffix"
    t.string "status"
    t.string "published_scope"
    t.string "tags"
    t.string "admin_graphql_api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.bigint "variant_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
    t.index ["variant_id"], name: "index_products_on_variant_id"
  end

  create_table "settings", force: :cascade do |t|
    t.binary "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_settings_on_offer_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "access_scopes"
    t.string "webhooks", default: [], array: true
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "shopify_id"
    t.string "title"
    t.string "price"
    t.string "sku"
    t.float "weight"
    t.string "weight_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

end
