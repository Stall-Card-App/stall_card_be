module Types
  module Input
    class VetInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :phone_number, String, required: true
    end
  end
end
