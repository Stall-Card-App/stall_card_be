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
    field :barn_id, Integer
    field :owner_id, Integer
    field :vet_id, Integer
    field :farrier_id, Integer
    
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :barns, [Types::BarnType], null: true
    field :owners, [Types::OwnerType], null: true
    field :vets, [Types::VetType], null: true
    field :farriers, [Types::FarrierType], null: true

  end
end
