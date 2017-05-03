class CreateLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :localities do |t|
      t.string :name

      t.timestamps
    end
  end
end
