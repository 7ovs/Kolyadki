class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :appartament, foreign_key: true
      t.string :offering
      t.text :comment
      t.date :date

      t.timestamps
    end
  end
end
