class RemoveAppartementFromAccommodations < ActiveRecord::Migration[5.0]
  def change
  	change_table :accommodations do |t|
  		t.remove :appartement 
  	end
  end
end
