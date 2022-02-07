module Types
  module Input
    class HorseInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :stall_number, Integer, required: true
      argument :age, Integer, required: true
      argument :breed, String, required: true
      argument :sex, String, required: true
      argument :color, String, required: true
      argument :markings, String, required: true
      argument :notes, String, required: true
      argument :am_feed, String, required: true
      argument :pm_feed, String, required: true
      argument :supplements, String, required: true
      argument :turnout, String, required: true
      argument :blanketing_temp, Integer, required: true
    end
  end
end
