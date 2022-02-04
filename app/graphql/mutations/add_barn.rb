module Mutations
  class AddBarn < Mutations::BaseMutation
    argument :params, Types::Input::BarnInputType, required: true

    field :barn, Types::BarnType, null: false

    def resolve(params:)
      barn_params = Hash params

      begin
        barn = Barn.create!(barn_params)

        { barn: barn }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end