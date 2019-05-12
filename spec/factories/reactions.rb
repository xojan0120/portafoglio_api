FactoryBot.define do
  factory :reaction do
    sequence(:name) { |i| "reaction#{i}" }
  end
end
