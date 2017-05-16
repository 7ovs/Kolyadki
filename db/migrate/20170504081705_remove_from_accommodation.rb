class RemoveFromAccommodation < ActiveRecord::Migration[5.0]
  def change
  	change_table :accommodations do |t|
		t.remove :street_id_id
	end
  end
end
