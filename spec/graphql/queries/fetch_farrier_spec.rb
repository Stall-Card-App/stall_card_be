require 'rails_helper'

module Queries
 RSpec.describe FetchFarrier, type: :request do
  describe '.resolve' do
    it 'can fetch a farrier' do
      farrier = create(:farrier)

      empty_farrier = FetchFarrier.new(field: nil, object: nil, context: {})
      query_farrier = empty_farrier.resolve(id: farrier.id)

      expect(query_farrier).to have_attributes(
        'id'              => query_farrier.id,
        'name'            => query_farrier.name
      )
    end
    it 'returns an error for id does not exist' do
      empty_farrier = FetchFarrier.new(field: nil, object: nil, context: {})
      query_farrier = empty_farrier.resolve(id: 1008765)

      expect(query_farrier).to eq(GraphQL::ExecutionError.new('Farrier does not exist.'))
    end
  end
 end
end
