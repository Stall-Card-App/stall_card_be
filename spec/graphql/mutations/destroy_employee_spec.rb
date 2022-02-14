require 'rails_helper'

module Mutations
  RSpec.describe DestroyEmployee, type: :input do
    describe '.resolve' do
      it 'can destroy a employee' do
        barn = create(:barn)
        employee = create(:employee, admin: true, barn_id: barn.id)

        expect(Employee.count).to eq(1)

        empty_employee = DestroyEmployee.new(field: nil, object: nil, context: {})

        destroy_employee = empty_employee.resolve(id: employee.id)

        expect(Employee.count).to eq(0)
      end
    end
  end
end
