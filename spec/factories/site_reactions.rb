FactoryBot.define do
   factory :site_reaction do
    site
    reaction
    user { site.user }
  end
end
