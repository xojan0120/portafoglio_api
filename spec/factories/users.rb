
FactoryBot.define do
  factory :user do
    sequence(:nickname) { |i| "nickname#{i}" }
    sequence(:uid)      { |i| "uid#{i}" }
  end
end
