class AddVitalityToKinships < ActiveRecord::Migration[8.0]
  def change
    add_column :kinships, :vitality, :integer
  end
end
