module Mutations
  class AddHorse < Mutations::BaseMutation
    argument :params, Types::Input::HorseInputType, required: true

    field :horse, Types::HorseType, null: false

    def resolve(params:)
      horse_params = Hash params

      begin
        horse = Horse.create!(horse_params)

        { horse: horse }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end