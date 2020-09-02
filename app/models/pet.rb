class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :adoption_pets
  has_many :adoptions, through: :adoption_pets
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :age
  validates_presence_of :sex
  validates_presence_of :adoption_status
end
