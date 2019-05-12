require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを作成できること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "userは複数のsiteを持てること" do
    user  = FactoryBot.create(:user)
    sites = FactoryBot.create_list(:site, 2, user: user)
    expect(user.sites).to match_array(sites)
  end

  it "userは複数のreactionを持てること" do
    user      = FactoryBot.create(:user)
    reactions = FactoryBot.create_list(:reaction, 2)
    reactions.each { |reaction|
      FactoryBot.create(:site_reaction, user: user, reaction: reaction)
    }
    expect(user.reactions).to match_array(reactions)
  end

  it { is_expected.to validate_presence_of(:nickname) }
  it { is_expected.to validate_length_of(:nickname)
                        .is_at_most(Settings.user.nickname.length.maximum) }

  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_uniqueness_of(:uid) }

end
