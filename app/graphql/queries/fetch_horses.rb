module Queries
  class FetchHorses < Queries::BaseQuery

    type [Types::HorseType], null: false

    def resolve
      Horse.all.order(name: :desc)
    end
  end
end
