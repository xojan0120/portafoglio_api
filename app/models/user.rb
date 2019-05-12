class User < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Association
  # ------------------------------------------------------------------------------------------------
  has_many :sites,                               dependent: :destroy
  has_many :site_reactions,                      dependent: :destroy
  has_many :reactions, through: :site_reactions, dependent: :destroy

  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :nickname, presence:   true,
                       length:     { maximum: Settings.user.nickname.length.maximum }

  validates :uid,      presence:   true,
                       uniqueness: true
end
