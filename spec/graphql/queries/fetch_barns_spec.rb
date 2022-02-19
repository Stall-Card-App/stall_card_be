require 'rails_helper'

module Queries
  RSpec.describe FetchBarns, type: :request do
    describe '.resolve' do
      it 'can fetch all barns' do
        barn_one = create(:barn)
        barn_two = create(:barn)
        barn_three = create(:barn)

        empty_barns = FetchBarns.new(field: nil, object: nil, context: {})
        query_barns = empty_barns.resolve
        total_barns = Barn.all.count

        expect(query_barns.count).to eq(total_barns)
      end
    end
  end
end
