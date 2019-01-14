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

ActiveRecord::Schema.define(version: 2019_01_14_190920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "picture"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_conversations_on_coach_id"
    t.index ["player_id"], name: "index_conversations_on_player_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "player_id"
    t.string "time"
    t.string "date"
    t.string "duration"
    t.string "location"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_lessons_on_coach_id"
    t.index ["player_id"], name: "index_lessons_on_player_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "time"
    t.string "date"
    t.string "subject"
    t.boolean "read"
    t.string "to"
    t.string "from"
    t.text "content"
    t.bigint "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.integer "age"
    t.string "level"
    t.string "picture"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conversations", "coaches"
  add_foreign_key "conversations", "players"
  add_foreign_key "lessons", "coaches"
  add_foreign_key "lessons", "players"
  add_foreign_key "messages", "conversations"
end
