class Skill < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Association
  # ------------------------------------------------------------------------------------------------
  has_many :site_skills
  has_many :sites, through: :site_skills

  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :name,     presence:   true,
                       uniqueness: { case_sensitive: false },
                       length:     { maximum: Settings.skill.name.length.maximum }
end
