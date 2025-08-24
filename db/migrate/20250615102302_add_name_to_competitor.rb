class AddNameToCompetitor < ActiveRecord::Migration[8.0]
  def change
    add_column :competitors, :name, :string
  end
end
