require 'rails_helper'

module Mutations
  RSpec.describe UpdateBarn, type: :input do
    describe '.resolve' do
      it 'can update a barn' do
        barn = create(:barn)

        post '/graphql', params: { params: { id: barn.id, name: "New Barn" }}

        expect(barn.reload).to have_attributes(
          'id'              => barn.id,
          'name'            => "New Barn"
        )
      end
    end
  end
end
