module Queries
  class FetchHorse < Queries::BaseQuery
    type Types::HorseType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Horse.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Horse does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
