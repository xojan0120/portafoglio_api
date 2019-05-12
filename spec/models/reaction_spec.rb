require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it "有効なファクトリを作成できること" do
    reaction = FactoryBot.build(:reaction)
    expect(reaction).to be_valid
  end

  it "reactionは複数のuserを持てること" do
    reaction = FactoryBot.create(:reaction)
    users    = FactoryBot.create_list(:user, 2)
    users.each { |user|
      FactoryBot.create(:site_reaction, user: user, reaction: reaction)
    }
    expect(reaction.users).to match_array(users)
  end

  it "reactionは複数のsiteを持てること" do
    reaction     = FactoryBot.create(:reaction)
    sites = FactoryBot.create_list(:site, 2)
    sites.each { |site|
      FactoryBot.create(:site_reaction, site: site, reaction: reaction)
    }
    expect(reaction.sites).to match_array(sites)
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_length_of(:name)
                        .is_at_most(Settings.reaction.name.length.maximum) }
end
