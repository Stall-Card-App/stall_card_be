require 'rails_helper'

RSpec.describe Horse, type: :model do
  it { should belong_to(:barn) }
  it { should belong_to(:owner) }
  it { should belong_to(:vet) }
  it { should belong_to(:farrier) }

  it { should validate_presence_of(:name) }
end
