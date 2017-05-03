class AddReligionToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :religion, :string
  end
end
