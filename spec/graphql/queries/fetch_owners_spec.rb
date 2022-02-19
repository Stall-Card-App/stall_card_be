require 'rails_helper'

module Queries
  RSpec.describe FetchOwners, type: :request do
    describe '.resolve' do
      it 'can fetch all owners' do
        owner_one = create(:owner)
        owner_two = create(:owner)
        owner_three = create(:owner)

        empty_owners = FetchOwners.new(field: nil, object: nil, context: {})
        query_owners = empty_owners.resolve
        total_owners = Owner.all.count

        expect(query_owners.count).to eq(total_owners)
      end
    end
  end
end
