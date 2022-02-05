require 'rails_helper'

RSpec.describe Owner, type: :model do
  #it { should belong_to(:horse) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
end
