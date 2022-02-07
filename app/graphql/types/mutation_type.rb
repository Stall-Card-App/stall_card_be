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
  end
end
