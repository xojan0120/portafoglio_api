require 'rails_helper'

RSpec.describe Skill, type: :model do
  it "有効なファクトリを作成できること" do
    skill = FactoryBot.build(:skill)
    expect(skill).to be_valid
  end

  it "skillは複数のsiteを持てること" do
    skill = FactoryBot.create(:skill)
    sites = FactoryBot.create_list(:site, 2)
    sites.each { |site|
      FactoryBot.create(:site_skill, site: site, skill: skill)
    }
    expect(skill.sites).to match_array(sites)
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_length_of(:name)
                        .is_at_most(Settings.skill.name.length.maximum) }

end
