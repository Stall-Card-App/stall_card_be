module Types
  class MutationType < Types::BaseObject
    field :add_barn, mutation: Mutations::AddBarn
  end
end
