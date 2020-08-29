require 'rails_helper'

RSpec.describe "Favorites index page", type: :feature do
  it "can see all favorited pets" do
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

    pet_2 = shelter_1.pets.create( image:  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDXuKrIAVvsVmj0Tur6KgFmaycQaIJOQM6jw&usqp=CAU",
                        name:   "Marie",
                        age:    "12",
                        sex:    "Female",
                        )

    pet_3 = shelter_1.pets.create( image:  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDXuKrIAVvsVmj0Tur6KgFmaycQaIJOQM6jw&usqp=CAU",
                        name:   "Ouzo",
                        age:    "4",
                        sex:    "Male",
                        )

    visit "/pets/#{pet_1.id}"

    click_link "Favorite"

    visit "/pets/#{pet_2.id}"

    click_link "Favorite"

    visit "/pets/#{pet_3.id}"

    click_link "Favorite"

    visit '/favorites'

    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")

    click_link 'Remove All Favorites'

    expect(page).to_not have_content("#{pet_1.name}")
    expect(page).to_not have_content("#{pet_2.name}")
    expect(page).to_not have_content("#{pet_3.name}")
    expect(page).to have_content("These are not the pets you are looking for.")
  end

end
