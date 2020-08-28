require 'rails_helper'

RSpec.describe "Pet specific show page", type: :feature do
  it "can add pet to favorites" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")


    pet_1 = shelter_1.pets.create(
                        name:   "Fido",
                        image:  "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg",
                        age:    "2",
                        sex:       "Male"
                      )

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
    expect(page).to have_link("Favorite")

    within "nav#favorites" do
      expect(page).to have_content("Favorites: 0")
    end
    
    click_link "Favorite"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("#{pet_1.name} added to favorites")

    within "nav#favorites" do
      expect(page).to have_content("Favorites: 1")
    end
  end
end
