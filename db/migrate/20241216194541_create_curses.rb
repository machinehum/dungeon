class CreateCurses < ActiveRecord::Migration[8.0]
  def change
    create_table :curses do |t|
      t.string :label
      t.string :stat
      t.string :effect

      t.timestamps
    end
  end
end
