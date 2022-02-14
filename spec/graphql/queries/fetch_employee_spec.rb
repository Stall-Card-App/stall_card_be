require 'rails_helper'

module Queries
 RSpec.describe FetchEmployee, type: :request do
  describe '.resolve' do
    it 'can fetch an employee' do
      barn = create(:barn)
      employee = create(:employee, admin: true, barn_id: barn.id)
      
      empty_employee = FetchEmployee.new(field: nil, object: nil, context: {})
      query_employee = empty_employee.resolve(id: employee.id)

      expect(query_employee).to have_attributes(
        'id'              => query_employee.id,
        'name'            => query_employee.name
      )
    end
  end
 end
end
