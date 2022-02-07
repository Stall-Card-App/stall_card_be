module Mutations
  class AddOwner < Mutations::BaseMutation
    argument :params, Types::Input::OwnerInputType, required: true

    field :owner, Types::OwnerType, null: false

    def resolve(params:)
      owner_params = Hash params

      begin
        owner = Owner.create!(owner_params)

        { owner: owner }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
