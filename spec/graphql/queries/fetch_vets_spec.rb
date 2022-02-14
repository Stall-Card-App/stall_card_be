require 'rails_helper'

module Queries
  RSpec.describe FetchVets, type: :request do
    describe '.resolve' do
      it 'can fetch all vets' do
        vet_one = create(:vet)
        vet_two = create(:vet)
        vet_three = create(:vet)

        empty_vets = FetchVets.new(field: nil, object: nil, context: {})
        query_vets = empty_vets.resolve

        expect(query_vets.count).to eq(3)
      end
    end
  end
end
