require 'rails_helper'

module Mutations
  RSpec.describe DestroyEmployee, type: :input do
    describe '.resolve' do
      it 'can destroy a employee' do
        barn = create(:barn)
        employee = create(:employee, admin: true, barn_id: barn.id)

        total_employees = Employee.all.count

        empty_employee = DestroyEmployee.new(field: nil, object: nil, context: {})

        destroy_employee = empty_employee.resolve(id: employee.id)

        new_total = Employee.all.count

        expect(new_total).to eq(total_employees - 1)
      end
    end
  end
end
