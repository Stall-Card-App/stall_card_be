require 'rails_helper'

module Queries
 RSpec.describe FetchHorse, type: :request do
  describe '.resolve' do
    it 'can fetch a horse' do
      barn = create(:barn)
      owner = create(:owner)
      vet = create(:vet)
      farrier = create(:farrier)
      horse = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)

      empty_horse = FetchHorse.new(field: nil, object: nil, context: {})
      query_horse = empty_horse.resolve(id: horse.id)

      expect(query_horse).to have_attributes(
        'id'              => query_horse.id,
        'name'            => query_horse.name
      )
    end
    it 'returns an error for id does not exist' do
      empty_horse = FetchHorse.new(field: nil, object: nil, context: {})
      query_horse = empty_horse.resolve(id: 15)

      expect(query_horse).to eq(GraphQL::ExecutionError.new('Horse does not exist.'))
    end
  end
 end
end
