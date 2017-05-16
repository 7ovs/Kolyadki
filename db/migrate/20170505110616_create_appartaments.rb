class CreateAppartaments < ActiveRecord::Migration[5.0]
  def change
    create_table :appartaments do |t|
      t.string :number
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
