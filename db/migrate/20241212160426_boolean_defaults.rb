class BooleanDefaults < ActiveRecord::Migration[8.0]
  def change
    change_column_default :npcs, :assertive, from: nil, to: false
    change_column_default :doors, :locked, from: nil, to: false
    change_column_default :doors, :window, from: nil, to: false
    change_column_default :edges, :directed, from: nil, to: false
    change_column_default :game_encounterables, :seen, from: nil, to: false
    change_column_default :game_encounterables, :active, from: nil, to: false
    change_column_default :game_npcs, :seen, from: nil, to: false
    change_column_default :game_npcs, :active, from: nil, to: false
    change_column_default :items, :equipable, from: nil, to: false
    change_column_default :items, :packable, from: nil, to: false
    change_column_default :items, :working, from: nil, to: false
    change_column_default :keys, :working, from: nil, to: false
  end
end
