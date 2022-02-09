require 'rails_helper'

module Mutations
  RSpec.describe AddFarrier, type: :request do
    describe '.resolve' do
      it 'can create a farrier' do
        farrier = create(:farrier)

        post '/graphql', params: { params: { name: farrier.name, phone_number: farrier.phone_number }}

        expect(farrier.reload).to have_attributes(
          'id'              => farrier.id,
          'name'            => farrier.name,
          'phone_number'    => farrier.phone_number
        )
      end
    end
  end
end
