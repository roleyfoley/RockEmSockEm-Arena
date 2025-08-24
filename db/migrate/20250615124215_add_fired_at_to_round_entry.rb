class AddFiredAtToRoundEntry < ActiveRecord::Migration[8.0]
  def change
    add_column :round_entries, :fired_at, :datetime
  end
end
