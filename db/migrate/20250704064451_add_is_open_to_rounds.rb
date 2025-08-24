class AddIsOpenToRounds < ActiveRecord::Migration[8.0]
  def change
    add_column :rounds, :is_open, :boolean
  end
end
