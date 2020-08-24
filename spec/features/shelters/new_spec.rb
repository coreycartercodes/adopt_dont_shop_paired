require 'rails_helper'

RSpec.describe "create new shelter" do
  describe "as a visitor" do
    describe "when I click 'New Shelter'" do
      it "can create a new shelter" do

        visit "/shelters"
        
        click_link "New Shelter"

        expect(current_path).to eq("/shelters/new")

        fill_in 'name', with: "New Hope Rescue"
        fill_in 'address',  with:     "208 Main St"
        fill_in 'city',      with:  "Denver"
        fill_in 'state',     with:   "CO"
        fill_in 'zip',       with: "80329"

        click_on "Create Shelter"
        expect(current_path).to eq("/shelters")
        expect(page).to have_content("New Hope Rescue")
      end
    end
  end
end
