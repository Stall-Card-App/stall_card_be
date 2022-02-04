require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { should belong_to(:barn) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:admin) }
end
