class CreateRoundEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :round_entries do |t|
      t.belongs_to :round
      t.belongs_to :competitor
      t.timestamps
    end
  end
end
