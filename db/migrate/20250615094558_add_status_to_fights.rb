class AddStatusToFights < ActiveRecord::Migration[8.0]
  def change
    add_column :fights, :status, :string
  end
end
