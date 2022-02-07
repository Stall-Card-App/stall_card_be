module Types
  module Input
    class FarrierInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :phone_number, String, required: true
    end
  end
end
