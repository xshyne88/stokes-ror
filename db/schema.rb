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

ActiveRecord::Schema.define(version: 2019_11_12_163638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duties", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "estimated_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "land_duties", force: :cascade do |t|
    t.bigint "land_id"
    t.bigint "duty_id"
    t.integer "estimated_days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duty_id"], name: "index_land_duties_on_duty_id"
    t.index ["land_id"], name: "index_land_duties_on_land_id"
  end

  create_table "lands", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "body"
    t.string "noteable_type", null: false
    t.bigint "noteable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id"
  end

  create_table "user_land_duties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "land_duty_id"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["land_duty_id"], name: "index_user_land_duties_on_land_duty_id"
    t.index ["user_id"], name: "index_user_land_duties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true, null: false
    t.boolean "admin", default: false, null: false
    t.integer "token_version", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "land_duties", "duties"
  add_foreign_key "land_duties", "lands"
  add_foreign_key "user_land_duties", "land_duties"
  add_foreign_key "user_land_duties", "users"
end
