require 'rails_helper'

RSpec.describe Farrier, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
end
