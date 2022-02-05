module Queries
  class FetchFarrier < Queries::BaseQuery
    type Types::FarrierType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Farrier.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Farrier does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
