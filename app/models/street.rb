class Street < ApplicationRecord
	belongs_to :locality
	has_many :houses
	validates :name, presence: true
end
