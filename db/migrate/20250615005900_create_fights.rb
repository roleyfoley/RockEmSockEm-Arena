class CreateFights < ActiveRecord::Migration[8.0]
  def change
    create_table :fights do |t|
      t.string :name

      t.timestamps
    end
  end
end
