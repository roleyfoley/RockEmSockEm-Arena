class RemoveRoundIdFromRound < ActiveRecord::Migration[8.0]
  def change
    remove_column :rounds, :round_id, :integer
  end
end
