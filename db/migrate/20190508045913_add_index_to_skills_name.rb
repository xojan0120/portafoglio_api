class AddIndexToSkillsName < ActiveRecord::Migration[5.1]
  def change
    add_index :skills, :name, unique: true
  end
end
