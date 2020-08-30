class AdoptionPet < ApplicationRecord
  belongs_to :pet
  belongs_to :adoption
end
