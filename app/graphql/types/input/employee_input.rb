module Types
  module Input
    class EmployeeInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :phone_number, String, required: true 
      argument :admin, Boolean, required: true
    end
  end
end