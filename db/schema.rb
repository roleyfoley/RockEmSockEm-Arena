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

ActiveRecord::Schema[8.0].define(version: 2025_07_04_070505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.string "instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "fights", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.datetime "starts_at"
  end

  create_table "round_entries", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target"
    t.datetime "fired_at"
    t.bigint "fight_id", null: false
    t.index ["competitor_id"], name: "index_round_entries_on_competitor_id"
    t.index ["fight_id"], name: "index_round_entries_on_fight_id"
    t.index ["round_id"], name: "index_round_entries_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fight_id", null: false
    t.integer "number"
    t.index ["fight_id"], name: "index_rounds_on_fight_id"
  end

  add_foreign_key "round_entries", "fights"
  add_foreign_key "rounds", "fights"
end
