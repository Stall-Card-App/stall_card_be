module Types
  class QueryType < Types::BaseObject
    # # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    field :fetch_barns, resolver: Queries::FetchBarns
    field :fetch_barn, resolver: Queries::FetchBarn
    field :fetch_employees, resolver: Queries::FetchEmployees
    field :fetch_employee, resolver: Queries::FetchEmployee
  end
end
