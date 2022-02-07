FactoryBot.define do
  factory :farrier do
    name { Faker::Name.name_with_middle }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
