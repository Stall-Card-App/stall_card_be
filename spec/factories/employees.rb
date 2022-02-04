FactoryBot.define do
  factory :employee do
    name { Faker::FunnyName.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end