class Employee < ApplicationRecord
  belongs_to :barn
  validates_presence_of :name, :phone_number, :admin
end
