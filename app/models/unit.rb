class Unit < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :name, presence:   true,
                   uniqueness: { case_sensitive: false }
end
