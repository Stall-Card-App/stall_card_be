class Horse < ApplicationRecord
  belongs_to :barn
  belongs_to :owner
  belongs_to :vet
  belongs_to :farrier

  validates_presence_of  :name, :stall_number, :age, :breed, :sex,
                        :color, :markings, :am_feed, :pm_feed,
                        :supplements, :turnout, :blanketing_temp,
                        :barn_id, :owner_id, :vet_id, :farrier_id
end
