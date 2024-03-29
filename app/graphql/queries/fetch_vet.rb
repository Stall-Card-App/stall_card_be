module Queries
  class FetchVet < Queries::BaseQuery
    type Types::VetType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Vet.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Vet does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
