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

ActiveRecord::Schema.define(version: 2019_09_26_195006) do

  create_table "attendances", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "attendee_id", null: false
    t.integer "invited_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
    t.index ["event_id", "attendee_id"], name: "index_attendances_on_event_id_and_attendee_id", unique: true
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["invited_by_id"], name: "index_attendances_on_invited_by_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "creator_id"
    t.string "description"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["date"], name: "index_events_on_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "users", column: "attendee_id"
  add_foreign_key "attendances", "users", column: "invited_by_id"
  add_foreign_key "events", "users", column: "creator_id"
end
