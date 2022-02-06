FactoryBot.define do
  factory :horse do
    name { Faker::Creature::Horse.name }
    stall_number { Faker::Number.between(from: 1, to: 75) }
    age { Faker::Number.between(from: 1, to: 30) }
    breed { Faker::Creature::Horse.breed }
    sex { Faker::Gender.binary_type }
    color { Faker::Color.color_name }
    markings { "MyString" }
    notes { "MyText" }
    am_feed { ["hay", "feed", "grain", "other"].sample }
    pm_feed { ["hay", "feed", "grain", "other"].sample }
    supplements { ["pellets", "copper", "zinc", "manganese", "iodine"].sample }
    turnout { "Day/Time" }
    blanketing_temp { Faker::Number.between(from: 0, to: 50) }
    barn { Faker::Number.between(from: 1, to: 10) }
    owner { Faker::Number.between(from: 1, to: 10) }
    vet { Faker::Number.between(from: 1, to: 10) }
    farrier { Faker::Number.between(from: 1, to: 10) }
  end
end
