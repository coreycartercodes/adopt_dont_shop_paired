class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews

  def delete_pets
    pets.each do |pet|
      pet.adoptions.clear
      pet.delete
    end
  end
end
