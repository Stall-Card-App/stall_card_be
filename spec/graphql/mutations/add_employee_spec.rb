require 'rails_helper'

module Mutations
  RSpec.describe AddEmployee, type: :request do
    describe '.resolve' do
      it 'can create an employee' do
        barn = create(:barn)

        employee = AddEmployee.new(field: nil, object: nil, context: {})

        new_employee = employee.resolve(params: { name: "Employee One", phone_number: "970-808-3455", admin: true, barn_id: barn.id } )

        expect(new_employee[:employee]).to have_attributes(
          'id'              => new_employee[:employee].id,
          'name'            => "Employee One",
          'phone_number'    => "970-808-3455",
          'admin'           => true,
          'barn_id'         => barn.id
        )
      end
      it 'has a sad path error' do
        barn = create(:barn)

        employee = AddEmployee.new(field: nil, object: nil, context: {})

        new_employee = employee.resolve(params: { name: "Employee One", phone_number: "970-808-3455", admin: true } )

        expect(new_employee).to eq(GraphQL::ExecutionError.new("Invalid attributes for Employee: Barn must exist"))
      end
    end
  end
end
