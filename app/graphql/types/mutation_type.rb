module Types
  class MutationType < Types::BaseObject
    field :add_barn, mutation: Mutations::AddBarn
    field :update_barn, mutation: Mutations::UpdateBarn
    field :destroy_barn, mutation: Mutations::DestroyBarn
    field :add_vet, mutation: Mutations::AddVet
    field :add_owner, mutation: Mutations::AddOwner
    field :add_farrier, mutation: Mutations::AddFarrier
  end
end
