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

ActiveRecord::Schema[7.0].define(version: 2022_04_06_091647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytics", force: :cascade do |t|
    t.string "geoloc"
    t.bigint "shortened_link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.string "city"
    t.string "country"
    t.string "lat"
    t.string "lon"
    t.index ["shortened_link_id"], name: "index_analytics_on_shortened_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "title", null: false
    t.string "href", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["href"], name: "index_links_on_href", unique: true
  end

  create_table "shortened_links", force: :cascade do |t|
    t.string "path"
    t.bigint "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_shortened_links_on_link_id"
    t.index ["path"], name: "index_shortened_links_on_path", unique: true
  end

  add_foreign_key "analytics", "shortened_links"
  add_foreign_key "shortened_links", "links"
end
