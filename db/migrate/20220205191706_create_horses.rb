class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :stall_number
      t.integer :age
      t.string :breed
      t.string :sex
      t.string :color
      t.string :markings
      t.text :notes
      t.string :am_feed
      t.string :pm_feed
      t.string :supplements
      t.string :turnout
      t.integer :blanketing_temp
      t.references :barn, foreign_key: true
      t.references :owner, foreign_key: true
      t.references :vet, foreign_key: true
      t.references :farrier, foreign_key: true

      t.timestamps
    end
  end
end
