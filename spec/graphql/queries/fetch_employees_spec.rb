require 'rails_helper'

module Queries
  RSpec.describe FetchEmployees, type: :request do
    describe '.resolve' do
      it 'can fetch all employees' do
        barn = create(:barn)
        employee_one = create(:employee, admin: true, barn_id: barn.id)
        employee_two = create(:employee, admin: true, barn_id: barn.id)
        employee_three = create(:employee, admin: true, barn_id: barn.id)

        empty_employees = FetchEmployees.new(field: nil, object: nil, context: {})
        query_employees = empty_employees.resolve
        total_employees = Employee.all.count

        expect(query_employees.count).to eq(total_employees)
      end
    end
  end
end
