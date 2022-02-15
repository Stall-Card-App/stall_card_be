require 'rails_helper'

module Mutations
  RSpec.describe DestroyVet, type: :input do
    describe '.resolve' do
      it 'can destroy a vet' do
        vet = create(:vet)

        total_vets = Vet.all.count

        empty_vet = DestroyVet.new(field: nil, object: nil, context: {})

        destroy_vet = empty_vet.resolve(id: vet.id)

        new_total = Vet.all.count

        expect(new_total).to eq(total_vets - 1)
      end
    end
  end
end
