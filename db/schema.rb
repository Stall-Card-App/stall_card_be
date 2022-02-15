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

ActiveRecord::Schema.define(version: 2022_02_15_201531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.boolean "admin", default: false
    t.bigint "barn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barn_id"], name: "index_employees_on_barn_id"
  end

  create_table "farriers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.integer "stall_number"
    t.integer "age"
    t.string "breed"
    t.string "sex"
    t.string "color"
    t.string "markings"
    t.text "notes"
    t.string "am_feed"
    t.string "pm_feed"
    t.string "supplements"
    t.string "turnout"
    t.integer "blanketing_temp"
    t.bigint "barn_id"
    t.bigint "owner_id"
    t.bigint "vet_id"
    t.bigint "farrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["barn_id"], name: "index_horses_on_barn_id"
    t.index ["farrier_id"], name: "index_horses_on_farrier_id"
    t.index ["owner_id"], name: "index_horses_on_owner_id"
    t.index ["vet_id"], name: "index_horses_on_vet_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vets", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "barns"
  add_foreign_key "horses", "barns"
  add_foreign_key "horses", "farriers"
  add_foreign_key "horses", "owners"
  add_foreign_key "horses", "vets"
end
