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

ActiveRecord::Schema[7.0].define(version: 2022_09_18_143420) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coincidences", force: :cascade do |t|
    t.text "description"
    t.bigint "comment_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_coincidences_on_comment_id"
    t.index ["person_id"], name: "index_coincidences_on_person_id"
  end

  create_table "comment_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "comment_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_type_id"], name: "index_comments_on_comment_type_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.bigint "zone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_people_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coincidences", "comments"
  add_foreign_key "coincidences", "people"
  add_foreign_key "comments", "comment_types"
  add_foreign_key "people", "zones"
end
