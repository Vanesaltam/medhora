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

ActiveRecord::Schema[8.1].define(version: 2026_05_20_005004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ai_consultations", force: :cascade do |t|
    t.text "ai_response"
    t.datetime "created_at", null: false
    t.bigint "patient_id", null: false
    t.string "suggested_specialty"
    t.text "symptoms"
    t.datetime "updated_at", null: false
    t.string "urgency_level"
    t.index ["patient_id"], name: "index_ai_consultations_on_patient_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "started_at"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_chats_on_appointment_id"
    t.index ["doctor_id"], name: "index_chats_on_doctor_id"
    t.index ["patient_id"], name: "index_chats_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.string "message_type"
    t.boolean "read"
    t.bigint "sender_user_id", null: false
    t.datetime "sent_at"
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["sender_user_id"], name: "index_messages_on_sender_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ai_consultations", "patients"
  add_foreign_key "chats", "appointments"
  add_foreign_key "chats", "doctors"
  add_foreign_key "chats", "patients"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users", column: "sender_user_id"
end
