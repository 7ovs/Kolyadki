class AddDogToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :dog, :boolean
  end
end
