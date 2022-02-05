class Vet < ApplicationRecord
  #belongs_to :horse
  validates_presence_of :name, :phone_number
end
