require 'rails_helper'

module Mutations
  RSpec.describe AddFarrier, type: :request do
    describe '.resolve' do
      it 'can create a farrier' do

        farrier = AddFarrier.new(field: nil, object: nil, context: {})

        new_farrier = farrier.resolve(params: { name: "New Farrier", phone_number: "970-818-5555" } )

        expect(new_farrier[:farrier]).to have_attributes(
          'id'              => new_farrier[:farrier].id,
          'name'            => "New Farrier",
          'phone_number'    => "970-818-5555"
        )
      end
    end
  end
end
