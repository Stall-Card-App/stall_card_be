module Types
  class MutationType < Types::BaseObject
    field :add_barn, mutation: Mutations::AddBarn
    field :update_barn, mutation: Mutations::UpdateBarn
    field :destroy_barn, mutation: Mutations::DestroyBarn

    field :add_employee, mutation: Mutations::AddEmployee
    field :update_employee, mutation: Mutations::UpdateEmployee
    field :destroy_employee, mutation: Mutations::DestroyEmployee

    field :add_horse, mutation: Mutations::AddHorse
    field :update_horse, mutation: Mutations::UpdateHorse
    field :destroy_horse, mutation: Mutations::DestroyHorse
    field :add_owner, mutation: Mutations::AddOwner
    field :update_owner, mutation: Mutations::UpdateOwner
    field :destroy_owner, mutation: Mutations::DestroyOwner

    field :add_vet, mutation: Mutations::AddVet
    field :update_vet, mutation: Mutations::UpdateVet
    field :destroy_vet, mutation: Mutations::DestroyVet

    field :add_farrier, mutation: Mutations::AddFarrier
    field :update_farrier, mutation: Mutations::UpdateFarrier
    field :destroy_farrier, mutation: Mutations::DestroyFarrier
  end
end
