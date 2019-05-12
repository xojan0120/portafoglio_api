FactoryBot.define do
  factory :site do
    user
    sequence(:name)         { |i| "site#{i}" }
    sequence(:url)          { |i| Faker::Internet.url }
    creation_period         { rand(1..10) }
    creation_period_unit_id 1
    comment                 Faker::Lorem.sentence
    screenshot              nil
  end
end
