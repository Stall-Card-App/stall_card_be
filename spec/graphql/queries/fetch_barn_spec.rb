require 'rails_helper'

module Queries
 RSpec.describe FetchBarn, type: :request do
  describe '.resolve' do
    it 'can fetch a barn' do
      barn = create(:barn)

      empty_barn = FetchBarn.new(field: nil, object: nil, context: {})
      query_barn = empty_barn.resolve(id: barn.id)

      expect(query_barn).to have_attributes(
        'id'              => query_barn.id,
        'name'            => query_barn.name
      )
    end
    it 'returns an error for id does not exist' do
      empty_barn = FetchBarn.new(field: nil, object: nil, context: {})
      query_barn = empty_barn.resolve(id: 5)

      expect(query_barn).to eq(GraphQL::ExecutionError.new('Barn does not exist.'))
    end
  end
 end
end
