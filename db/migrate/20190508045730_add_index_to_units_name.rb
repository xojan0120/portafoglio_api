class AddIndexToUnitsName < ActiveRecord::Migration[5.1]
  def change
    add_index :units, :name, unique: true
  end
end
