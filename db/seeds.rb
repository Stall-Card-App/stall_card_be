require 'factory_bot_rails'

10.times do
  FactoryBot.create(:barn)
end

(1..10).each do |i|
  FactoryBot.create(:employee, admin: true, barn_id: i)
end

10.times do
  FactoryBot.create(:owner)
end
