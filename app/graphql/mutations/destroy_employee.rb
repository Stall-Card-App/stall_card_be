module Mutations
  class DestroyEmployee < Mutations::BaseMutation
    argument :id, Integer, required: true 

    field :employee, Types::EmployeeType, null: false

    def resolve(id:)

      begin
        employee = Employee.find(id)
        employee.destroy

        { employee: employee }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end