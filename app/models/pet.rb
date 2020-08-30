class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :adoption_pets
  has_many :adoptions, through: :adoption_pets
end
