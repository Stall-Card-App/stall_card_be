FactoryBot.define do
  factory :vet do
    name { Faker::Company.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
