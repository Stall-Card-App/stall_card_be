require 'factory_bot_rails'

10.times do
  FactoryBot.create(:barn)
end 

(1..10).each do |i|
  FactoryBot.create(:employee, barn_id: i)
end 