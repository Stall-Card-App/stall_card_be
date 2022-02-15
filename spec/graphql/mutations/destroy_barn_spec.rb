require 'rails_helper'

module Mutations
  RSpec.describe DestroyBarn, type: :input do
    describe '.resolve' do
      it 'can destroy a barn' do
        barn = create(:barn)

        total_barns = Barn.all.count

        empty_barn = DestroyBarn.new(field: nil, object: nil, context: {})

        destroy_barn = empty_barn.resolve(id: barn.id)

        new_total = Barn.all.count
        
        expect(new_total).to eq(total_barns - 1)
      end
    end
  end
end
