class AddTargetToRoundEntry < ActiveRecord::Migration[8.0]
  def change
    add_column :round_entries, :target, :integer
  end
end
