# frozen_string_literal: true

module Types
  class HorseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :stall_number, Integer
    field :age, Integer
    field :breed, String
    field :sex, String
    field :color, String
    field :markings, String
    field :notes, String
    field :am_feed, String
    field :pm_feed, String
    field :supplements, String
    field :turnout, String
    field :blanketing_temp, Integer
    # field :barn_id, [Types::BarnType], null: true
    # field :owner_id, [Types::OwnerType], null: true
    # field :vet_id, [Types::VetType], null: true
    # field :farrier_id, [Types::FarrierType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :barn, [Types::BarnType], null: true
    field :owner, [Types::OwnerType], null: true
    field :vet, [Types::VetType], null: true
    field :farrier, [Types::FarrierType], null: true

  end
end
