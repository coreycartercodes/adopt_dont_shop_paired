require 'rails_helper'

RSpec.describe "update existing shelter" do
  describe "as a visitor" do
    describe "when I click on a shelter" do
      it "can update the information" do
        shelter_1 = Shelter.create(name:       "New Hope Rescue",
                                  address:     "208 Main St",
                                  city:        "Denver",
                                  state:       "CO",
                                  zip:         "80329")

        visit "/shelters/#{shelter_1.id}"

        click_link "Update Shelter"

        expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

        fill_in 'name', with: "Coreys Place"

        click_on "Update Shelter"
        expect(current_path).to eq("/shelters/#{shelter_1.id}")
        expect(page).to have_content("Coreys Place")
      end
    end
  end
end
