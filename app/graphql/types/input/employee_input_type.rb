module Types
  module Input
    class EmployeeInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :phone_number, String, required: true 
      argument :admin, Boolean, required: true
      argument :barn_id, Integer, required: true
    end
  end
end