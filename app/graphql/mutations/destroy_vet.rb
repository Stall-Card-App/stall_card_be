module Mutations
  class DestroyVet < Mutations::BaseMutation
    argument :id, Integer, required: true

    field :vet, Types::VetType, null: false

    def resolve(id:)

      begin
        vet = Vet.find(id)
        vet.destroy

        { vet: vet }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
