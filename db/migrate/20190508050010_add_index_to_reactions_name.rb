class AddIndexToReactionsName < ActiveRecord::Migration[5.1]
  def change
    add_index :reactions, :name, unique: true
  end
end
