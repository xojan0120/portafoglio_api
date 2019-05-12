class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.integer :count
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
