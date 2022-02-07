module Mutations
  class UpdateBarn < Mutations::BaseMutation
    argument :params, Types::Input::BarnInputType, required: true

    field :barn, Types::BarnType, null: false

    def resolve(params:)
      barn_params = Hash params
      require 'pry'; binding.pry

      begin
        barn = Barn.find(params[:id])
        barn.update!(barn_params)

        { barn: barn }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end