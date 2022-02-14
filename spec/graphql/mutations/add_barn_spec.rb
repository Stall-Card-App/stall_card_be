require 'rails_helper'

module Mutations
  RSpec.describe AddBarn, type: :request do
    describe '.resolve' do
      it 'can create a barn' do

        barn = AddBarn.new(field: nil, object: nil, context: {})

        new_barn = barn.resolve(params: { name: "New Barn" } )

        expect(new_barn[:barn]).to have_attributes(
          'id'              => new_barn[:barn].id,
          'name'            => "New Barn"
        )
      end
    end
  end
end
