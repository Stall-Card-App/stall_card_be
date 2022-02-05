module Queries
  class FetchVets < Queries::BaseQuery

    type [Types::VetType], null: false

    def resolve
      Vet.all.order(name: :desc)
    end
  end
end
