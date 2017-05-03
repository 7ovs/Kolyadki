class Accommodation < ApplicationRecord
  belongs_to :locality

  def self.locality_choices
  	Locality.all.map{|local| [local.name, local.id]}
  end

  def self.kind_choices
  	[['Частный дом', 'Частный дом'], ['Блок', 'Блок']]
  end

  def dog_presence
  	if self.dog
  		"Yes"
  	else
  		"No"
  	end
  end	
end
