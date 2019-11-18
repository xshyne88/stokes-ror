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

ActiveRecord::Schema.define(version: 2019_11_14_204314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "completed_duties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "land_duty_id"
    t.datetime "expires_at"
    t.boolean "expired", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["land_duty_id"], name: "index_completed_duties_on_land_duty_id"
    t.index ["user_id"], name: "index_completed_duties_on_user_id"
  end

  create_table "duties", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "icon", default: "tasks"
    t.integer "estimated_days", default: 14
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "land_duties", force: :cascade do |t|
    t.bigint "land_id"
    t.bigint "duty_id"
    t.integer "estimated_days", default: 14
    t.datetime "expires_at"
    t.string "last_completed_by"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duty_id"], name: "index_land_duties_on_duty_id"
    t.index ["land_id"], name: "index_land_duties_on_land_id"
  end

  create_table "lands", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.string "last_completed_duty"
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

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true, null: false
    t.boolean "admin", default: false, null: false
    t.integer "token_version", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "completed_duties", "land_duties"
  add_foreign_key "completed_duties", "users"
  add_foreign_key "land_duties", "duties"
  add_foreign_key "land_duties", "lands"
end
