require 'rails_helper'

module Mutations
  RSpec.describe DestroyOwner, type: :input do
    describe '.resolve' do
      it 'can destroy an owner' do
        owner = create(:owner)

        total_owners = Owner.all.count

        empty_owner = DestroyOwner.new(field: nil, object: nil, context: {})

        destroy_owner = empty_owner.resolve(id: owner.id)

        new_total = Owner.all.count
        
        expect(new_total).to eq(total_owners - 1)
      end
    end
  end
end
