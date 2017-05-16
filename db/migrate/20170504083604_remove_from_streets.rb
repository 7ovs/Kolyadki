class RemoveFromStreets < ActiveRecord::Migration[5.0]
  def change
  	change_table :streets do |t|
		t.remove :localities_id
		t.references :locality
	end
  end
end
