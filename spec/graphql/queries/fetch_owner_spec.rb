require 'rails_helper'

module Queries
 RSpec.describe FetchOwner, type: :request do
  describe '.resolve' do
    it 'can fetch an owner' do
      owner = create(:owner)

      empty_owner = FetchOwner.new(field: nil, object: nil, context: {})
      query_owner = empty_owner.resolve(id: owner.id)

      expect(query_owner).to have_attributes(
        'id'              => query_owner.id,
        'name'            => query_owner.name
      )
    end
    it 'returns an error for id does not exist' do
      empty_owner = FetchOwner.new(field: nil, object: nil, context: {})
      query_owner = empty_owner.resolve(id: 1008765)

      expect(query_owner).to eq(GraphQL::ExecutionError.new('Owner does not exist.'))

    end
  end
 end
end
