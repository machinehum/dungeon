class AddVitalityToPlayers < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :vitality, :integer
  end
end
