module Queries
  class FetchOwner < Queries::BaseQuery
    type Types::OwnerType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Owner.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Owner does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
