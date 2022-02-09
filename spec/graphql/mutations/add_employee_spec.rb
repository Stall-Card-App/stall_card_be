require 'rails_helper'

module Mutations
  RSpec.describe AddEmployee, type: :request do
    describe '.resolve' do
      it 'can create an employee' do
        barn = create(:barn)
        employee = create(:employee, admin: true, barn_id: barn.id)

        post '/graphql', params: { params: { name: employee.name, phone_number: employee.phone_number, barn_id: barn.id }}

        expect(employee.reload).to have_attributes(
          'id'              => employee.id,
          'name'            => employee.name,
          'phone_number'    => employee.phone_number,
          'admin'           => true,
          'barn_id'         => barn.id
        )
      end
    end
  end
end
