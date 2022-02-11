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
  end
 end
end
