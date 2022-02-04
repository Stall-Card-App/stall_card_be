module Types
  module Input
    class BarnInputType < Types::BaseInputObject
      argument :name, String, required: true
    end
  end
end