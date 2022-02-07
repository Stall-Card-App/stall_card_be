class Barn < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :horses, dependent: :destroy 
  validates_presence_of :name
end
