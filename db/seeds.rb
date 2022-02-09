require 'factory_bot'

10.times do
  FactoryBot.create(:barn)
end

(1..10).each do |i|
  FactoryBot.create(:employee, admin: true, barn_id: i)
end

10.times do
  FactoryBot.create(:owner)
end

10.times do
  FactoryBot.create(:vet)
end

10.times do
  FactoryBot.create(:farrier)
end

(1..10).each do |i|
  FactoryBot.create(:horse, barn_id: i, owner_id: i, vet_id: i, farrier_id: i)
end
