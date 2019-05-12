class CreateSiteSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :site_skills do |t|
      t.references :site, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
