class AddLocationToBarn < ActiveRecord::Migration[5.2]
  def change
    add_column :barns, :location, :string
  end
end
