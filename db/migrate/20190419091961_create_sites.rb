class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :url
      t.integer :creation_period
      t.integer :creation_period_unit_id
      t.string :comment
      t.string :screenshot

      t.timestamps
    end
  end
end
