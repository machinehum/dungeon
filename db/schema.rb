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

ActiveRecord::Schema[8.0].define(version: 2024_12_12_195338) do
  create_table "abilities", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_stat_mods", force: :cascade do |t|
    t.integer "character_stats_id", null: false
    t.string "stat_attribute"
    t.integer "modifier"
    t.datetime "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_stats_id"], name: "index_character_stat_mods_on_character_stats_id"
  end

  create_table "character_stats", force: :cascade do |t|
    t.string "stattable_type", null: false
    t.integer "stattable_id", null: false
    t.integer "health"
    t.integer "strength"
    t.integer "speed"
    t.integer "bravery"
    t.integer "cunning"
    t.integer "healing"
    t.integer "knowledge"
    t.integer "connectedness"
    t.integer "arcadia"
    t.integer "load_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stattable_type", "stattable_id"], name: "index_character_stats_on_stattable"
  end

  create_table "doors", force: :cascade do |t|
    t.integer "portal_id", null: false
    t.boolean "locked", default: false
    t.text "description"
    t.boolean "window", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portal_id"], name: "index_doors_on_portal_id"
  end

  create_table "edges", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.float "weight"
    t.boolean "directed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_encounterables", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "encounterable_type", null: false
    t.integer "encounterable_id", null: false
    t.integer "game_node_id"
    t.boolean "seen", default: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounterable_type", "encounterable_id"], name: "index_game_encounterables_on_encounterable"
    t.index ["game_id"], name: "index_game_encounterables_on_game_id"
    t.index ["game_node_id"], name: "index_game_encounterables_on_game_node_id"
  end

  create_table "game_items", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "item_id", null: false
    t.integer "player_id"
    t.integer "node_id"
    t.boolean "equipped", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_items_on_game_id"
    t.index ["item_id"], name: "index_game_items_on_item_id"
    t.index ["node_id"], name: "index_game_items_on_node_id"
    t.index ["player_id"], name: "index_game_items_on_player_id"
  end

  create_table "game_nodes", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "node_id", null: false
    t.boolean "visited", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_nodes_on_game_id"
    t.index ["node_id"], name: "index_game_nodes_on_node_id"
  end

  create_table "game_npcs", force: :cascade do |t|
    t.integer "npc_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_npcs_on_game_id"
    t.index ["npc_id"], name: "index_game_npcs_on_npc_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_node_id"
    t.index ["game_node_id"], name: "index_games_on_game_node_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "npc_id"
    t.boolean "equipable", default: false
    t.integer "weight"
    t.boolean "packable", default: false
    t.string "label"
    t.text "description"
    t.boolean "working", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "inspection"
    t.index ["npc_id"], name: "index_items_on_npc_id"
  end

  create_table "keys", force: :cascade do |t|
    t.integer "door_id", null: false
    t.text "description"
    t.boolean "working", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_id"], name: "index_keys_on_door_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.string "locatable_type", null: false
    t.integer "locatable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["locatable_type", "locatable_id"], name: "index_nodes_on_locatable"
  end

  create_table "npc_dialogues", force: :cascade do |t|
    t.integer "npc_id", null: false
    t.integer "npc_responses_id"
    t.text "dialogue"
    t.boolean "initial", default: true
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npc_id"], name: "index_npc_dialogues_on_npc_id"
    t.index ["npc_responses_id"], name: "index_npc_dialogues_on_npc_responses_id"
  end

  create_table "npc_responses", force: :cascade do |t|
    t.integer "npc_dialogue_id", null: false
    t.integer "next_dialogue_id", null: false
    t.text "response_text"
    t.text "effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_dialogue_id"], name: "index_npc_responses_on_next_dialogue_id"
    t.index ["npc_dialogue_id"], name: "index_npc_responses_on_npc_dialogue_id"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "assertive", default: false
    t.boolean "combatable", default: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.integer "imageable_id", null: false
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "character_class_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_class_id"], name: "index_players_on_character_class_id"
  end

  create_table "portals", force: :cascade do |t|
    t.integer "node_id", null: false
    t.integer "edge_id", null: false
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edge_id"], name: "index_portals_on_edge_id"
    t.index ["node_id"], name: "index_portals_on_node_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.text "label"
    t.string "description"
    t.boolean "outdoor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terras", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_stat_mods", "character_stats", column: "character_stats_id"
  add_foreign_key "doors", "portals"
  add_foreign_key "game_encounterables", "game_nodes"
  add_foreign_key "game_encounterables", "games"
  add_foreign_key "game_items", "games"
  add_foreign_key "game_items", "items"
  add_foreign_key "game_items", "nodes"
  add_foreign_key "game_items", "players"
  add_foreign_key "game_nodes", "games"
  add_foreign_key "game_nodes", "nodes"
  add_foreign_key "game_npcs", "games"
  add_foreign_key "game_npcs", "npcs"
  add_foreign_key "games", "game_nodes"
  add_foreign_key "games", "players"
  add_foreign_key "items", "npcs"
  add_foreign_key "keys", "doors"
  add_foreign_key "npc_dialogues", "npc_responses", column: "npc_responses_id"
  add_foreign_key "npc_dialogues", "npcs"
  add_foreign_key "npc_responses", "npc_dialogues"
  add_foreign_key "npc_responses", "npc_dialogues", column: "next_dialogue_id"
  add_foreign_key "players", "character_classes"
  add_foreign_key "portals", "edges"
  add_foreign_key "portals", "nodes"
end
