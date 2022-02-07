module Mutations
  class DestroyFarrier < Mutations::BaseMutation
    argument :id, Integer, required: true

    field :farrier, Types::FarrierType, null: false

    def resolve(id:)

      begin
        farrier = Farrier.find(id)
        farrier.destroy

        { farrier: farrier }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
