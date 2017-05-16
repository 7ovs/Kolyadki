class AddOpenToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :comments, :string
    add_column :comments, :open, :boolean
  end
end
