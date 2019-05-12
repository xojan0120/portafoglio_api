class Reaction < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Association
  # ------------------------------------------------------------------------------------------------
  has_many :site_reactions
  has_many :users, through: :site_reactions
  has_many :sites, through: :site_reactions

  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :name,     presence:   true,
                       uniqueness: { case_sensitive: false },
                       length:     { maximum: Settings.reaction.name.length.maximum }
end
