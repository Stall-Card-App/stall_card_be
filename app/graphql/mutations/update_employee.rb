module Mutations
  class UpdateEmployee < Mutations::BaseMutation
    argument :id, Integer, required: true 
    argument :params, Types::Input::EmployeeInputType, required: true

    field :employee, Types::EmployeeType, null: false

    def resolve(id:, params:)
      employee_params = Hash params

      begin
        employee = Employee.find(id)
        employee.update!(employee_params)

        { employee: employee }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end