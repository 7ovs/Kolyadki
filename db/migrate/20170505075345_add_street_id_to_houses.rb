class AddStreetIdToHouses < ActiveRecord::Migration[5.0]
  def change
    add_reference :houses, :street, foreign_key: true
  end
end
