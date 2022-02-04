# frozen_string_literal: true

module Types
  class BarnType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :employees, [Types::EmployeeType], null: true
  end 
end
