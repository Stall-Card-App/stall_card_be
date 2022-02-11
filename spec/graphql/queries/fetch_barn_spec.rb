require 'rails_helper'

module Queries
 RSpec.describe FetchBarn, type: :request do
  describe '.resolve' do
   it 'can fetch a barn' do
      barn = create(:barn)

      empty_barn = FetchBarn.new(field: nil, object: nil, context: {})
      query_barn = empty_barn.resolve(id: barn.id)

      expect(query_barn).to have_attributes(
        'id'              => query_barn.id,
        'name'            => query_barn.name
      )

   end
  end
 end
end

# RSpec.describe Queries::FetchBarn, type: :request do
#   describe '.resolve' do
#     it 'can fetch a barn by id' do
#
#       barn = create(:barn)
#
#       expect(Barn.count).to eq(1)
#
#       #post '/graphql', params: { params: { id: barn.id, name: barn.name }}
#       post '/graphql', params: { params: { id: barn.id, name: barn.name }}
#
#       result = JSON.parse(response.body, symbolize_names: true)
#       require "pry"; binding.pry
#     end
#   end
#
# end


# query {
#   fetchBarn(id: 3) {
#     id
#     name
#   }
# }
#
# {
#   "data": {
#     "fetchBarn": {
#       "id": "3",
#       "name": "Rev. Carey Kiehn",
#
#     }
#   }
# }
