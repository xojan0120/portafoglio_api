class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :username
      t.string :email
      t.string :avatar

      t.timestamps
    end
  end
end
