class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews

  def delete_pets
    pets.each do |pet|
      pet.adoptions.clear
      pet.delete
    end
  end

  def delete_reviews
    reviews.each do |review|
      review.delete
    end
  end
end
