class AddShelterToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :shelter_id, :string
    add_reference :reviews, :shelters, foreign_key: true
  end
end
