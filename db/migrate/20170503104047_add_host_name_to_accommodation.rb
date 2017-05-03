class AddHostNameToAccommodation < ActiveRecord::Migration[5.0]
  def change
		change_table :accommodations do |t|
		t.remove :host_name
		t.string :host_name, :null=>true
	end
  end
end
