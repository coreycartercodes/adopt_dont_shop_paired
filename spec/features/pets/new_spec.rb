require 'rails_helper'

RSpec.describe "From Shelter Pets Index Page", type: :feature do
  it "can create a new pet" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link 'Create Pet'
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    fill_in 'image', with: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg"
    fill_in 'name',  with:     "Fido"
    fill_in 'description',      with:  "A real good boy"
    fill_in 'age',     with:   "12"
    fill_in 'sex',       with: "male"

    click_on "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/")
    expect(page).to have_content("Fido")
    expect(page).to have_content("12")
    expect(page).to have_content("male")
    expect(page).to have_content("Adoptable")
  end
end
