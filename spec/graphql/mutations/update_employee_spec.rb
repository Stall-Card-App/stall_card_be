require 'rails_helper'

module Mutations
  RSpec.describe UpdateEmployee, type: :input do
    describe '.resolve' do
      it 'can update an employee' do
        barn = create(:barn)
        employee = create(:employee, admin: true, barn_id: barn.id)

        empty_employee = UpdateEmployee.new(field: nil, object: nil, context: {})

        new_employee = empty_employee.resolve(id: employee.id, params: { name: "New Employee" } )

        expect(new_employee[:employee].name).to eq("New Employee")
      end
    end
  end
end
