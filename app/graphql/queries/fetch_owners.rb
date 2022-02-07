module Queries
  class FetchOwners < Queries::BaseQuery

    type [Types::OwnerType], null: false

    def resolve
      Owner.all.order(name: :desc)
    end
  end
end
