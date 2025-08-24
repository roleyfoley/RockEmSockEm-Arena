class RemoveIsOpenFromRounds < ActiveRecord::Migration[8.0]
  def change
    remove_column :rounds, :is_open, :boolean
  end
end
