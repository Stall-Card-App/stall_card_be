module Types
  class MutationType < Types::BaseObject
    field :add_barn, mutation: Mutations::AddBarn
    field :update_barn, mutation: Mutations::UpdateBarn
    field :destroy_barn, mutation: Mutations::DestroyBarn
  end
end
