# frozen_string_literal: true

module Types
  class FarrierType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :phone_number, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
