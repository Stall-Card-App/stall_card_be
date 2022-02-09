require 'rails_helper'

module Mutations
  RSpec.describe AddVet, type: :request do
    describe '.resolve' do
      it 'can create a vet' do
        vet = create(:vet)

        post '/graphql', params: { params: { name: vet.name, phone_number: vet.phone_number }}

        expect(vet.reload).to have_attributes(
          'id'              => vet.id,
          'name'            => vet.name,
          'phone_number'    => vet.phone_number
        )
      end
    end
  end
end
