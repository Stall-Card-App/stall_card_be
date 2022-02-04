class CreateBarns < ActiveRecord::Migration[5.2]
  def change
    create_table :barns do |t|
      t.string :name

      t.timestamps
    end
  end
end
