require 'rails_helper'

module Mutations
  RSpec.describe AddOwner, type: :request do
    describe '.resolve' do
      it 'can create an owner' do
        owner = create(:owner)
        
        post '/graphql', params: { params: { name: owner.name, phone_number: owner.phone_number }}

        expect(owner.reload).to have_attributes(
          'id'              => owner.id,
          'name'            => owner.name,
          'phone_number'    => owner.phone_number
        )
      end
    end
  end
end
