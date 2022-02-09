require 'rails_helper'

module Mutations
  RSpec.describe AddHorse, type: :request do
    describe '.resolve' do
      it 'can create a horse' do

        barn = create(:barn)
        owner = create(:owner)
        vet = create(:vet)
        farrier = create(:farrier)
        horse = create(:horse, barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id)

        post '/graphql', params: { params: { name: horse.name, stall_number: horse.stall_number, age: horse.age,
                                  breed: horse.breed, sex: horse.sex, color: horse.color, markings: horse.markings,
                                  notes: horse.notes, am_feed: horse.am_feed, pm_feed: horse.pm_feed,
                                  supplements: horse.supplements, turnout: horse.turnout, blanketing_temp: horse.blanketing_temp,
                                  barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id}}

        expect(horse.reload).to have_attributes(
          'id'              => horse.id,
          'name'            => horse.name,
          'stall_number'    => horse.stall_number,
          'age'             => horse.age,
          'breed'           => horse.breed,
          'sex'             => horse.sex,
          'color'           => horse.color,
          'markings'        => horse.markings,
          'notes'           => horse.notes,
          'am_feed'         => horse.am_feed,
          'pm_feed'         => horse.pm_feed,
          'supplements'     => horse.supplements,
          'turnout'         => horse.turnout,
          'blanketing_temp' => horse.blanketing_temp,
          'barn_id'         => barn.id,
          'owner_id'        => owner.id,
          'vet_id'          => vet.id,
          'farrier_id'      => farrier.id
        )
      end
    end
  end
end
