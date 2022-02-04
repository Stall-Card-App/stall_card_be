class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone_number
      t.boolean :admin, default: false
      t.references :barn, foreign_key: true

      t.timestamps
    end
  end
end
