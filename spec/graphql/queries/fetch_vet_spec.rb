require 'rails_helper'

module Queries
 RSpec.describe FetchVet, type: :request do
  describe '.resolve' do
    it 'can fetch a vet' do
      vet = create(:vet)

      empty_vet = FetchVet.new(field: nil, object: nil, context: {})
      query_vet = empty_vet.resolve(id: vet.id)

      expect(query_vet).to have_attributes(
        'id'              => query_vet.id,
        'name'            => query_vet.name
      )
    end
    it 'returns an error for id does not exist' do
      empty_vet = FetchVet.new(field: nil, object: nil, context: {})
      query_vet = empty_vet.resolve(id: 5)

      expect(query_vet).to eq(GraphQL::ExecutionError.new('Vet does not exist.'))
    end
  end
 end
end
