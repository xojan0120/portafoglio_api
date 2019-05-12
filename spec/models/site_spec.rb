require 'rails_helper'

RSpec.describe Site, type: :model do
  it "有効なファクトリを作成できること" do
    site = FactoryBot.build(:site)
    expect(site).to be_valid
  end

  it "siteは1人のuserを持つこと" do
    site = FactoryBot.create(:site)
    expect(site.user).to eq User.first
  end

  it "siteは1つのunitを持つこと" do
    unit = FactoryBot.create(:unit, name:"month")
    site = FactoryBot.create(:site, creation_period_unit_id: unit.id)
    expect(site.creation_period_unit).to eq Unit.first
  end

  it "siteは複数のskillを持てること" do
    site = FactoryBot.create(:site)
    skills = FactoryBot.create_list(:skill, 2)
    skills.each { |skill| 
      FactoryBot.create(:site_skill, site: site, skill: skill)
    }
    expect(site.skills).to match_array(skills)
  end

  it "siteは複数のreactionを持てること" do
    site = FactoryBot.create(:site)
    reactions = FactoryBot.create_list(:reaction, 2)
    reactions.each { |reaction|
      FactoryBot.create(:site_reaction, site: site, reaction: reaction)
    }
    expect(site.reactions).to match_array(reactions)
  end

  it "siteは1つのviewを持つこと" do
    site = FactoryBot.create(:site)
    view = FactoryBot.create(:view, site: site)
    expect(site.view).to eq view
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name)
                        .is_at_most(Settings.site.name.length.maximum) }

  it { is_expected.to validate_presence_of(:url) }
  it "urlの書式が正しければ有効であること" do
    site = FactoryBot.build(:site, url: Faker::Internet.url)
    expect(site).to be_valid
  end
  it "urlの書式が正しくなければ無効であること" do
    site = FactoryBot.build(:site,
                                     url: Faker::Internet.url.delete("http://"))
    expect(site).to be_invalid
  end
  it { is_expected.to validate_length_of(:url)
                        .is_at_most(Settings.site.url.length.maximum) }

  it { is_expected.to validate_length_of(:comment)
                        .is_at_most(Settings.site.comment.length.maximum) }

  it { is_expected.to validate_length_of(:screenshot)
                        .is_at_most(Settings.site.screenshot.length.maximum) }
end
