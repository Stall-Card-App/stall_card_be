require 'rails_helper'

module Mutations
  RSpec.describe UpdateOwner, type: :input do
    describe '.resolve' do
      it 'can update an owner' do
        owner = create(:owner)

        empty_owner = UpdateOwner.new(field: nil, object: nil, context: {})

        new_owner = empty_owner.resolve(id: owner.id, params: { name: "New Owner", phone_number: "303-425-0900" } )

        expect(new_owner[:owner].name).to eq("New Owner")
        expect(new_owner[:owner].phone_number).to eq("303-425-0900")
      end
    end
  end
end
