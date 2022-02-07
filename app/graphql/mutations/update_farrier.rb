module Mutations
  class UpdateFarrier < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :params, Types::Input::FarrierInputType, required: true

    field :farrier, Types::FarrierType, null: false

    def resolve(id:, params:)
      farrier_params = Hash params

      begin
        farrier = Farrier.find(id)
        farrier.update!(farrier_params)

        { farrier: farrier }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
