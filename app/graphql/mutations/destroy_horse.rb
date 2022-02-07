module Mutations
  class DestroyHorse < Mutations::BaseMutation
    argument :id, Integer, required: true 

    field :horse, Types::HorseType, null: false

    def resolve(id:)

      begin
        horse = Horse.find(id)
        horse.destroy

        { horse: horse }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end