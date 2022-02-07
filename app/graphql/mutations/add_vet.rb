module Mutations
  class AddVet < Mutations::BaseMutation
    argument :params, Types::Input::VetInputType, required: true

    field :vet, Types::VetType, null: false

    def resolve(params:)
      vet_params = Hash params

      begin
        vet = Vet.create!(vet_params)

        { vet: vet }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
