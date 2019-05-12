require 'rails_helper'

RSpec.describe SiteSkill, type: :model do
  it "有効なファクトリを作成できること" do
    site_skill = FactoryBot.build(:site_skill)
    expect(site_skill).to be_valid
  end

  it "site_skillは1つのsiteに属すること" do
    site_skill = FactoryBot.create(:site_skill)
    expect(site_skill.site).to eq Site.first
  end

  it "site_skillは1つのskillに属すること" do
    site_skill = FactoryBot.create(:site_skill)
    expect(site_skill.skill).to eq Skill.first
  end
end
