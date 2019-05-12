class Site < ApplicationRecord
  # ------------------------------------------------------------------------------------------------
  # Association
  # ------------------------------------------------------------------------------------------------
  belongs_to :user

  # creation_period_unitというassociationメソッドを定義
  # 参照先はclass_name: 'Unit'
  # 参照元のキー(primary_key)はSiteのcreation_period_unit_id
  # 参照先のキー(foreign_key)はUnitのid
  has_one    :creation_period_unit,  class_name: 'Unit', primary_key: :creation_period_unit_id, foreign_key: :id

  has_many   :site_skills,                         dependent: :destroy
  has_many   :skills, through: :site_skills,       dependent: :destroy
  has_many   :site_reactions,                      dependent: :destroy
  has_many   :reactions, through: :site_reactions, dependent: :destroy
  has_one    :view,                                dependent: :destroy

  # ------------------------------------------------------------------------------------------------
  # Validate
  # ------------------------------------------------------------------------------------------------
  validates :name,       presence: true,
                         length:   { maximum: Settings.site.name.length.maximum }

  validates :url,        presence: true,
                         format:   { with:    CommonRegexp::format_url },
                         length:   { maximum: Settings.site.url.length.maximum }

  validates :comment,    length:   { maximum: Settings.site.comment.length.maximum }

  validates :screenshot, length:   { maximum: Settings.site.screenshot.length.maximum }
end
