require 'rails_helper'

module Mutations
  RSpec.describe UpdateBarn, type: :input do
    describe '.resolve' do
      it 'can update a barn' do
        barn = create(:barn)

        empty_barn = UpdateBarn.new(field: nil, object: nil, context: {})

        new_barn = empty_barn.resolve(id: barn.id, params: { name: "New Barn" } )

        expect(new_barn[:barn].name).to eq("New Barn")
      end
    end
  end
end
