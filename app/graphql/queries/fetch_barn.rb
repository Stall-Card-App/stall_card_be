module Queries
  class FetchBarn < Queries::BaseQuery
    type Types::BarnType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Barn.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Barn does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
