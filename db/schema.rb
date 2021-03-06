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

ActiveRecord::Schema.define(version: 2018_11_27_064133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "manager_id"
  end

  create_table "databases", force: :cascade do |t|
    t.string "text"
    t.json "text_result"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_databases_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "company"
    t.string "braintree_customer_id"
    t.bigint "company_id"
    t.string "image"
    t.string "position"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "videos", force: :cascade do |t|
    t.string "video_result"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "result_happy", default: [], array: true
    t.string "result_sad", default: [], array: true
    t.string "result_anger", default: [], array: true
    t.string "result_contempt", default: [], array: true
    t.string "result_disgust", default: [], array: true
    t.string "result_fear", default: [], array: true
    t.string "result_neutral", default: [], array: true
    t.string "result_surprise", default: [], array: true
    t.string "time", default: [], array: true
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "databases", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "videos", "users"
end
