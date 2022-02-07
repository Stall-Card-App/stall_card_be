module Mutations
  class DestroyBarn < Mutations::BaseMutation
    argument :id, Integer, required: true 

    field :barn, Types::BarnType, null: false

    def resolve(id:)

      begin
        barn = Barn.find(id)
        barn.destroy

        { barn: barn }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end