class House < ApplicationRecord
	belongs_to :street
	has_many :appartaments

	def self.kind_choices
        [['Частный дом', 'Частный дом'], ['Блок', 'Блок']]
    end
end
