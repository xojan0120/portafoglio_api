class SiteReaction < ApplicationRecord
  belongs_to :site
  belongs_to :reaction
  belongs_to :user

  validates :site_id, uniqueness: { scope: [:reaction_id, :user_id] }
end
