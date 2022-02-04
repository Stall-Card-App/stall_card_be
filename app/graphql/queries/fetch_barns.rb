module Queries
  class FetchBarns < Queries::BaseQuery

    type [Types::BarnType], null: false

    def resolve
      Barn.all.order(name: :desc)
    end
  end
end