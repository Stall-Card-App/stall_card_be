# frozen_string_literal: true

module Types
  class OwnerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :phone_number, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
