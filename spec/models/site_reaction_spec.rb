require 'rails_helper'

RSpec.describe SiteReaction, type: :model do
  it "有効なファクトリを作成できること" do
    site_reaction = FactoryBot.build(:site_reaction)
    expect(site_reaction).to be_valid
  end

  it "site_reactionは1人のuserに属すること" do
    site_reaction = FactoryBot.create(:site_reaction)
    expect(site_reaction.user).to eq User.first
  end

  it "site_reactionは1つのsiteに属すること" do
    site_reaction = FactoryBot.create(:site_reaction)
    expect(site_reaction.site).to eq Site.first
  end

  it "site_reactionは1つのreactionに属すること" do
    site_reaction = FactoryBot.create(:site_reaction)
    expect(site_reaction.reaction).to eq Reaction.first
  end

  it "site_id, reaction_id, user_idで一意であること" do
    site_reaction1 = FactoryBot.create(:site_reaction)
    site_reaction2 = SiteReaction.new(site: site_reaction1.site, reaction: site_reaction1.reaction, user: site_reaction1.user)
    expect(site_reaction2).to be_invalid
  end
end
