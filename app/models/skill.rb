class Skill < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Association
  # ------------------------------------------------------------------------------------------------
  has_many :site_skills
  has_many :sites, through: :site_skills

  before_save   :downcase_name

  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :name,     presence:   true,
                       uniqueness: { case_sensitive: false },
                       length:     { maximum: Settings.skill.name.length.maximum }

  private

    def downcase_name
      self.name.downcase!
    end
end
