require 'rails_helper'

# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page
RSpec.describe "When I visit a Pet Show page", type: :feature do
  it "can update a pet" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    pet_1 = shelter_1.pets.create(
                        name:   "Fido",
                        image:  "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg",
                        age:    "12",
                        sex:       "Male"
                      )
    visit "/shelters/#{shelter_1.id}/pets/#{pet_1.id}"

    expect(page).to have_content("Update Pet")

    click_link 'Update Pet'

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in 'name',  with:     "Sir Nubbington"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Sir Nubbington")
    expect(page).to have_content("12")
    expect(page).to have_content("Male")
    expect(page).to have_content("Adoptable")
  end
end
