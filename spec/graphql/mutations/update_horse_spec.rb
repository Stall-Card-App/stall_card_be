require 'rails_helper'

module Mutations
  RSpec.describe UpdateHorse, type: :input do
    describe '.resolve' do
      it 'can update a horse' do
        barn = create(:barn)
        owner = create(:owner)
        vet = create(:vet)
        farrier = create(:farrier)
        horse = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)

        empty_horse = UpdateHorse.new(field: nil, object: nil, context: {})

        new_horse = empty_horse.resolve(id: horse.id, params: { name: "New Horse", stall_number: 17 } )

        expect(new_horse[:horse].name).to eq("New Horse")
        expect(new_horse[:horse].stall_number).to eq(17)
      end
    end
  end
end
