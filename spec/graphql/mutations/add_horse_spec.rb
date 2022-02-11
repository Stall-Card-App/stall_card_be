require 'rails_helper'

module Mutations
  RSpec.describe AddHorse, type: :request do
    describe '.resolve' do
      it 'can create a horse' do
        barn = create(:barn)
        owner = create(:owner)
        vet = create(:vet)
        farrier = create(:farrier)
        horse = AddHorse.new(field: nil, object: nil, context: {})

        new_horse = horse.resolve(params: { name: "Cookie", stall_number: 7, age: 15,
                                  breed: "haflinger", sex: "M", color: "gray", markings: "no markings",
                                  notes: "outside all day", am_feed: "hay", pm_feed: "hay",
                                  supplements: "all supplements", turnout: "8 am", blanketing_temp: 25,
                                  barn_id: barn.id, owner_id: owner.id, vet_id: vet.id, farrier_id: farrier.id } )

        expect(new_horse[:horse]).to have_attributes(
          'id'              => new_horse[:horse].id,
          'name'            => "Cookie",
          'stall_number'    => 7,
          'age'             => 15,
          'breed'           => "haflinger",
          'sex'             => "M",
          'color'           => "gray",
          'markings'        => "no markings",
          'notes'           => "outside all day",
          'am_feed'         => "hay",
          'pm_feed'         => "hay",
          'supplements'     => "all supplements",
          'turnout'         => "8 am",
          'blanketing_temp' => 25,
          'barn_id'         => barn.id,
          'owner_id'        => owner.id,
          'vet_id'          => vet.id,
          'farrier_id'      => farrier.id
        )
      end
    end
  end
end
