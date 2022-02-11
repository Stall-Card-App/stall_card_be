require 'rails_helper'

module Mutations
  RSpec.describe AddVet, type: :request do
    describe '.resolve' do
      it 'can create a vet' do

        vet = AddVet.new(field: nil, object: nil, context: {})

        new_vet = vet.resolve(params: { name: "New Vet", phone_number: "970-808-3421" } )

        expect(new_vet[:vet]).to have_attributes(
          'id'              => new_vet[:vet].id,
          'name'            => "New Vet",
          'phone_number'    => "970-808-3421"
        )
      end
    end
  end
end
