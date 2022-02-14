require 'rails_helper'

module Mutations
  RSpec.describe UpdateVet, type: :input do
    describe '.resolve' do
      it 'can update a vet' do
        vet = create(:vet)

        empty_vet = UpdateVet.new(field: nil, object: nil, context: {})

        new_vet = empty_vet.resolve(id: vet.id, params: { name: "New Vet", phone_number: "303-771-0900" } )

        expect(new_vet[:vet].name).to eq("New Vet")
        expect(new_vet[:vet].phone_number).to eq("303-771-0900")
      end
    end
  end
end
