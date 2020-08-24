class AddDescriptionToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :description, :string, default: "A nice fleabag lookin for a place to crash."
  end
end
