class Appartament < ApplicationRecord
  belongs_to :house
  has_many :comments
end
