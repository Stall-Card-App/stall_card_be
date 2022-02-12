require 'rails_helper'

module Mutations
  RSpec.describe DestroyHorse, type: :input do
    describe '.resolve' do
      it 'can destroy a horse' do
        barn = create(:barn)
        owner = create(:owner)
        vet = create(:vet)
        farrier = create(:farrier)
        horse = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)

        expect(Horse.count).to eq(1)

        empty_horse = DestroyHorse.new(field: nil, object: nil, context: {})

        destroy_horse = empty_horse.resolve(id: horse.id)

        expect(Horse.count).to eq(0)
      end
    end
  end
end
