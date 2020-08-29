require 'rails_helper'

RSpec.describe "Favorites show page", type: :feature do
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

    within "nav#favorites" do
      expect(page).to have_content("Favorites: 0")
    end

    click_link "Favorite"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("#{pet_1.name} added to favorites")

    within "nav#favorites" do
      expect(page).to have_content("Favorites: 1")
    end

    visit "/pets/#{pet_2.id}"
    click_link "Favorite"

    expect(current_path).to eq("/pets/#{pet_2.id}")
    expect(page).to have_content("#{pet_2.name} added to favorites")
    expect(page).to have_link('Favorites: 2')

    within "nav#favorites" do
      expect(page).to have_content("Favorites: 2")
    end
    expect(page).to have_link("Favorites: 2")

    visit "/favorites"

    within "div#pet-#{pet_1.id}" do
      expect(page).to have_content(pet_1.name)
      # expect(page).to have_css("/img[@src='#{pet_1.image}']")
      expect(page).to have_link("Unfavorite")
    end

    within "div#pet-#{pet_2.id}" do
      expect(page).to have_content(pet_2.name)
      # expect(page).to have_css("/img[@src='#{pet_2.image}']")
      expect(page).to have_link("Unfavorite")
      click_link "Unfavorite"
    end
    expect(current_path).to eq('/favorites')
    expect(page).to have_link("Favorites: 1")
    expect(page).to_not have_link(pet_2.name)
    expect(page).to_not have_content(pet_3.name)
    # expect(page).to_not have_css("/img[src*='#{pet_3.image}']")
  end
end
