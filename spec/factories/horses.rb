FactoryBot.define do
  factory :horse do
    name { "MyString" }
    stall_number { 1 }
    age { 1 }
    breed { "MyString" }
    sex { "MyString" }
    color { "MyString" }
    markings { "MyString" }
    notes { "MyText" }
    am_feed { "MyString" }
    pm_feed { "MyString" }
    supplements { "MyString" }
    turnout { "MyString" }
    blanketing_temp { 1 }
    barn { nil }
    owner { nil }
    vet { nil }
    farrier { nil }
  end
end
