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

ActiveRecord::Schema.define(version: 20180403144502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.boolean "published"
    t.integer "pos"
    t.integer "col"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_contents_on_page_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "shortext"
    t.text "longtext"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer "location_id"
    t.string "link"
    t.string "label"
    t.string "organizer"
    t.string "organizerlink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ptype"
    t.string "image"
    t.string "status"
    t.integer "program_id"
    t.string "locationtext"
    t.index ["title"], name: "index_events_on_title"
  end

  create_table "flyers", id: :serial, force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "email"
    t.string "web"
    t.string "twitter"
    t.string "lat"
    t.string "lon"
    t.text "shortext"
    t.text "longtext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "published"
    t.boolean "in_menu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "backgroundcolor"
    t.string "textcolor1"
    t.string "textcolor2"
    t.string "image"
    t.string "backgroundimage"
    t.boolean "current", default: false, null: false
    t.string "backgroundimage_credit"
    t.string "image_credit"
    t.string "backgroundimage_credit_link"
    t.string "image_credit_link"
    t.string "backgroundimage_display", default: "cover", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 40
    t.string "authorizable_type", limit: 40
    t.integer "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login", null: false
    t.string "firstname"
    t.string "lastname"
    t.datetime "deleted_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "contents", "pages"
end
