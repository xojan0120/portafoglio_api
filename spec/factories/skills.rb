FactoryBot.define do
  factory :skill do
    sequence(:name) { |i| "skill#{i}" }
  end
end
