module Queries
  class FetchFarriers < Queries::BaseQuery

    type [Types::FarrierType], null: false

    def resolve
      Farrier.all.order(name: :desc)
    end
  end
end
