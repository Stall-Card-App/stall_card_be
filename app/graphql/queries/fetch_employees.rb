module Queries
  class FetchEmployees < Queries::BaseQuery

    type [Types::EmployeeType], null: false

    def resolve
      Employee.all.order(name: :desc)
    end
  end
end