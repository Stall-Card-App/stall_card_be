require 'rails_helper'

RSpec.describe Barn, type: :model do
  it { should have_many(:employees).dependent(:destroy) }
  it { should have_many(:horses).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
