require 'rails_helper'

module Mutations
  RSpec.describe DestroyOwner, type: :input do
    describe '.resolve' do
      it 'can destroy an owner' do
        owner = create(:owner)

        expect(Owner.count).to eq(1)

        empty_owner = DestroyOwner.new(field: nil, object: nil, context: {})

        destroy_owner = empty_owner.resolve(id: owner.id)

        expect(Owner.count).to eq(0)
      end
    end
  end
end
