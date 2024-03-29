require 'rails_helper'

RSpec.describe Vet, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
end
