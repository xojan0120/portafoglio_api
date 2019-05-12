require 'rails_helper'

RSpec.describe Unit, type: :model do
  it "有効なファクトリを作成できること" do
    unit = FactoryBot.build(:unit)
    expect(unit).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
