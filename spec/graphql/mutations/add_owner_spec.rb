require 'rails_helper'

module Mutations
  RSpec.describe AddOwner, type: :request do
    describe '.resolve' do
      it 'can create an owner' do

        owner = AddOwner.new(field: nil, object: nil, context: {})

        new_owner = owner.resolve(params: { name: "New Owner", phone_number: "970-818-3303" } )

        expect(new_owner[:owner]).to have_attributes(
          'id'              => new_owner[:owner].id,
          'name'            => "New Owner",
          'phone_number'    => "970-818-3303"
        )
      end
      it 'has a sad path error' do
        owner = AddOwner.new(field: nil, object: nil, context: {})

        new_owner = owner.resolve(params: { name: "New Owner" } )

        expect(new_owner).to eq(GraphQL::ExecutionError.new("Invalid attributes for Owner: Phone number can't be blank"))
      end
    end
  end
end
