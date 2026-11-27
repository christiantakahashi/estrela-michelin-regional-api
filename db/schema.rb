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

ActiveRecord::Schema[8.1].define(version: 2026_11_27_185709) do
  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "state"], name: "index_cities_on_name_and_state", unique: true
  end

  create_table "restaurant_tags", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id", "tag_id"], name: "index_restaurant_tags_on_restaurant_id_and_tag_id", unique: true
    t.index ["restaurant_id"], name: "index_restaurant_tags_on_restaurant_id"
    t.index ["tag_id"], name: "index_restaurant_tags_on_tag_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.integer "city_id", null: false
    t.string "neighborhood"
    t.string "address"
    t.integer "price_range"
    t.integer "status", default: 0, null: false
    t.datetime "approved_at"
    t.decimal "average_rating", precision: 2, scale: 1, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_restaurants_on_city_id"
    t.index ["status"], name: "index_restaurants_on_status"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category", "name"], name: "index_tags_on_category_and_name", unique: true
  end

  add_foreign_key "restaurant_tags", "restaurants"
  add_foreign_key "restaurant_tags", "tags"
  add_foreign_key "restaurants", "cities"
end
