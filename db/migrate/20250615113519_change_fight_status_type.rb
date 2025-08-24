class ChangeFightStatusType < ActiveRecord::Migration[8.0]
  def change
    change_column :fights, :status, :integer, using: 'status::integer', default: 0
  end
end
