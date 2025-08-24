class AddStartsAtToFight < ActiveRecord::Migration[8.0]
  def change
    add_column :fights, :starts_at, :datetime
  end
end
