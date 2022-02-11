require 'rails_helper'

module Mutations
  RSpec.describe UpdateFarrier, type: :input do
    describe '.resolve' do
      it 'can update a farrier' do
        farrier = create(:farrier)

        empty_farrier = UpdateFarrier.new(field: nil, object: nil, context: {})

        new_farrier = empty_farrier.resolve(id: farrier.id, params: { name: "New Farrier", phone_number: "555-721-0934" } )

        expect(new_farrier[:farrier].name).to eq("New Farrier")
        expect(new_farrier[:farrier].phone_number).to eq("555-721-0934")
      end
    end
  end
end
