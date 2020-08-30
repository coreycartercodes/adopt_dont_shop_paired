class CreateAdoptionPets < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_pets do |t|
      t.references :pet, foreign_key: true
      t.references :adoption, foreign_key: true
    end
  end
end
