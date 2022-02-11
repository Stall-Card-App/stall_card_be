require 'rails_helper'

module Queries
  RSpec.describe FetchFarriers, type: :request do
    describe '.resolve' do
      it 'can fetch all farriers' do
        farrier_one = create(:farrier)
        farrier_two = create(:farrier)
        farrier_three = create(:farrier)

        empty_farriers = FetchFarriers.new(field: nil, object: nil, context: {})
        query_farriers = empty_farriers.resolve

        expect(query_farriers.count).to eq(3)
      end
    end
  end
end
