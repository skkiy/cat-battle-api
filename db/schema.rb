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

ActiveRecord::Schema[7.0].define(version: 2022_07_02_195438) do
  create_table "boards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "fk_rails_1f4dcdc327"
    t.index ["id", "game_id"], name: "index_boards_on_id_and_game_id", unique: true
  end

  create_table "cats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "kind", null: false
    t.integer "player"
    t.bigint "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "kind", "player"], name: "index_cats_on_board_id_and_kind_and_player", unique: true
  end

  create_table "game_actions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order", null: false
    t.integer "player", null: false
    t.integer "from_where"
    t.integer "to_where", null: false
    t.bigint "board_id", null: false
    t.bigint "cat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "order"], name: "index_game_actions_on_board_id_and_order", unique: true
    t.index ["cat_id"], name: "fk_rails_8f401b863c"
  end

  create_table "games", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "home_user_id"
    t.bigint "away_user_id"
    t.integer "first_player", default: 0, null: false
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["away_user_id"], name: "fk_rails_7d07b11fb1"
    t.index ["home_user_id"], name: "fk_rails_70b27cce3f"
  end

  create_table "squares", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "place", null: false
    t.bigint "board_id", null: false
    t.bigint "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "fk_rails_f03ff37982"
    t.index ["cat_id"], name: "fk_rails_1368bd0a99"
    t.index ["place", "board_id"], name: "index_squares_on_place_and_board_id", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "boards", "games"
  add_foreign_key "cats", "boards"
  add_foreign_key "game_actions", "boards"
  add_foreign_key "game_actions", "cats"
  add_foreign_key "games", "users", column: "away_user_id"
  add_foreign_key "games", "users", column: "home_user_id"
  add_foreign_key "squares", "boards"
  add_foreign_key "squares", "cats"
end
