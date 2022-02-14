require 'rails_helper'

module Mutations
  RSpec.describe DestroyVet, type: :input do
    describe '.resolve' do
      it 'can destroy a vet' do
        vet = create(:vet)

        expect(Vet.count).to eq(1)

        empty_vet = DestroyVet.new(field: nil, object: nil, context: {})

        destroy_vet = empty_vet.resolve(id: vet.id)

        expect(Vet.count).to eq(0)
      end
    end
  end
end
