module Mutations
  class AddFarrier < Mutations::BaseMutation
    argument :params, Types::Input::FarrierInputType, required: true

    field :farrier, Types::FarrierType, null: false

    def resolve(params:)
      farrier_params = Hash params

      begin
        farrier = Farrier.create!(farrier_params)

        { farrier: farrier }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
