class AddNumberToRound < ActiveRecord::Migration[8.0]
  def change
    add_column :rounds, :number, :integer
  end
end
