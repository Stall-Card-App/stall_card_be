module Mutations
  class DestroyOwner < Mutations::BaseMutation
    argument :id, Integer, required: true

    field :owner, Types::OwnerType, null: false

    def resolve(id:)

      begin
        owner = Owner.find(id)
        owner.destroy

        { owner: owner }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
