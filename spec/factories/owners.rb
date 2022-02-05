FactoryBot.define do
  factory :owner do
    name { Faker::Name.unique.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
