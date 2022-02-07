module Mutations
  class UpdateOwner < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :params, Types::Input::OwnerInputType, required: true

    field :owner, Types::OwnerType, null: false

    def resolve(id:, params:)
      owner_params = Hash params

      begin
        owner = Owner.find(id)
        owner.update!(owner_params)

        { owner: owner }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
