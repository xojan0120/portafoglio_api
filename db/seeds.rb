Reaction.create!([
  {name: "good"},
  {name: "cool"}
])
Skill.create!([
  {name: "ruby"},
  {name: "rails"},
  {name: "javascript"},
  {name: "react"}
])
Unit.create!([
  {name: "hour"},
  {name: "day"},
  {name: "week"},
  {name: "month"}
])
User.create!([
  {nickname: "木戸涼介1", uid: "LjerCKMBGDT7LDgh0EWE9dB6LQ82"},
  {nickname: "john smith", uid: "dummy"}
])
Site.create!([
  {user_id: 1, name: "site1", url: "http://example1.com", creation_period: 1, creation_period_unit_id: 1, comment: "comment1", screenshot: "https://user-images.githubusercontent.com/33190342/57138740-712e1400-6dee-11e9-9687-5bf05c1d8043.png"},
  {user_id: 1, name: "site2", url: "http://example2.com", creation_period: 2, creation_period_unit_id: 1, comment: "comment2", screenshot: "https://user-images.githubusercontent.com/33190342/57018635-3c3f8700-6c5f-11e9-8f89-50feefc3bd71.png"},
  {user_id: 2, name: "site3", url: "http://example3.com", creation_period: 2, creation_period_unit_id: 1, comment: "comment3", screenshot: "https://user-images.githubusercontent.com/33190342/56965008-38483200-6b97-11e9-81b2-bc95c9b0b55b.png"}
])
View.create!([
  {count: 10, site_id: 1},
  {count: 20, site_id: 2},
  {count: 30, site_id: 3}
])
SiteReaction.create!([
  {site_id: 1, reaction_id: 1, user_id: 1},
  {site_id: 1, reaction_id: 1, user_id: 2},
  {site_id: 1, reaction_id: 2, user_id: 1},
  {site_id: 2, reaction_id: 1, user_id: 1}
])
SiteSkill.create!([
  {site_id: 1, skill_id: 1},
  {site_id: 1, skill_id: 2},
  {site_id: 2, skill_id: 3}
])
