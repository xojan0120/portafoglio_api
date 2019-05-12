require 'rails_helper'

RSpec.describe View, type: :model do
  it "有効なファクトリを作成できること" do
    view = FactoryBot.build(:view)
    expect(view).to be_valid
  end

  it "viewは1つのsiteに属すること" do
    view = FactoryBot.create(:view)
    expect(view.site).to eq Site.first
  end

  it { is_expected.to validate_presence_of(:count) }
end
