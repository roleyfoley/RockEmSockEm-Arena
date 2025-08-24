class AddFightRefToRounds < ActiveRecord::Migration[8.0]
  def change
    add_reference :rounds, :fight, null: false, foreign_key: true
  end
end
