class CreateSiteReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :site_reactions do |t|
      t.references :site, foreign_key: true
      t.references :reaction, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
