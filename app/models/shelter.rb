class Shelter < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
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

  def count_adoptions
    adoptions_count = pets.map do |pet|
      pet.adoptions
    end
    adoptions_count.flatten.uniq.count
  end

  def average_rating
    reviews.average(:rating)
  end

  def count_pets
    pets.count
  end
end
