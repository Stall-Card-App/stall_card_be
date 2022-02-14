module Queries
  RSpec.describe FetchHorses, type: :request do
    describe '.resolve' do
      it 'can fetch all horses' do
        barn = create(:barn)
        owner = create(:owner)
        vet = create(:vet)
        farrier = create(:farrier)

        horse_one = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)
        horse_two = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)
        horse_three = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)

        empty_horses = FetchHorses.new(field: nil, object: nil, context: {})
        query_horses = empty_horses.resolve

        expect(query_horses.count).to eq(3)
      end
    end
  end
end
