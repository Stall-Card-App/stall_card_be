require 'rails_helper'

module Mutations
  RSpec.describe DestroyFarrier, type: :input do
    describe '.resolve' do
      it 'can destroy a farrier' do
        farrier = create(:farrier)

        total_farriers = Farrier.all.count

        empty_farrier = DestroyFarrier.new(field: nil, object: nil, context: {})

        destroy_farrier = empty_farrier.resolve(id: farrier.id)

        new_total = Farrier.all.count

        expect(new_total).to eq(total_farriers - 1)
      end
    end
  end
end
