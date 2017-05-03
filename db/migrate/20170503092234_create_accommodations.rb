class CreateAccommodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations do |t|
      t.references :locality, foreign_key: true
      t.string :street
      t.string :house
      t.text :kind
      t.string :appartement

      t.timestamps
    end
  end
end
