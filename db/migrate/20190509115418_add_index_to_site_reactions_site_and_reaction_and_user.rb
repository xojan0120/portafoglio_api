class AddIndexToSiteReactionsSiteAndReactionAndUser < ActiveRecord::Migration[5.1]
  def change
    add_index :site_reactions, [:site_id, :reaction_id, :user_id], unique: true
  end
end
