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

ActiveRecord::Schema[7.2].define(version: 2025_07_09_014414) do
  create_table "urls", charset: "utf8mb3", force: :cascade do |t|
    t.string "original_url", null: false
    t.string "shorted_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shorted_url"], name: "index_urls_on_shorted_url", unique: true
  end
end
