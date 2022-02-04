FactoryBot.define do
  factory :barn do
    name { Faker::FunnyName.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end