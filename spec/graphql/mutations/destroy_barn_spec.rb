require 'rails_helper'

module Mutations
  RSpec.describe DestroyBarn, type: :input do
    describe '.resolve' do
      it 'can destroy a barn' do
        barn = create(:barn)
        expect(Barn.count).to eq(1)

        empty_barn = DestroyBarn.new(field: nil, object: nil, context: {})

        destroy_barn = empty_barn.resolve(id: barn.id)

        expect(Barn.count).to eq(0)
      end
    end
  end
end
