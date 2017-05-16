class AddLiabilityToHouses < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :houses, :string
    add_column :houses, :liability, :string
  end
end
