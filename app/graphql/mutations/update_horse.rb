module Mutations
  class UpdateHorse < Mutations::BaseMutation
    argument :id, Integer, required: true 
    argument :params, Types::Input::HorseInputType, required: true

    field :horse, Types::HorseType, null: false

    def resolve(id:, params:)
      horse_params = Hash params

      begin
        horse = Horse.find(id)
        horse.update!(horse_params)

        { horse: horse }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end