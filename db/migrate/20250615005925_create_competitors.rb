class CreateCompetitors < ActiveRecord::Migration[8.0]
  def change
    create_table :competitors do |t|
      t.string :instance_id

      t.timestamps
    end
  end
end
