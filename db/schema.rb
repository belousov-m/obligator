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

ActiveRecord::Schema.define(version: 2021_10_18_171518) do

  create_table "bonds", force: :cascade do |t|
    t.string "name"
    t.string "shortname"
    t.string "isin"
    t.integer "face_value"
    t.string "face_unit"
    t.integer "days_to_redemption"
    t.date "mat_date"
    t.date "coupon_date"
    t.integer "coupon_value"
    t.integer "coupon_percent"
    t.string "bond_type"
    t.string "type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
