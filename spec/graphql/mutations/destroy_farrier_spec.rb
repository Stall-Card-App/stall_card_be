require 'rails_helper'

module Mutations
  RSpec.describe DestroyFarrier, type: :input do
    describe '.resolve' do
      it 'can destroy a farrier' do
        farrier = create(:farrier)

        expect(Farrier.count).to eq(1)

        empty_farrier = DestroyFarrier.new(field: nil, object: nil, context: {})

        destroy_farrier = empty_farrier.resolve(id: farrier.id)

        expect(Farrier.count).to eq(0)
      end
    end
  end
end
