require 'rails_helper'

RSpec.describe "Apply for adoption page", type: :feature do
  it "can submit new adoption" do
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

    pet_3 = shelter_1.pets.create(image: "Mr.cats-pic", name: "Mr. Cat", age: "9", sex: "male", description: "Has Russian accent")

    visit "/pets/#{pet_1.id}"

    click_link "Favorite"

    visit "/pets/#{pet_2.id}"

    click_link "Favorite"

    visit "/pets/#{pet_3.id}"

    click_link "Favorite"

    visit "/favorites"

    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")
    expect(page).to have_link("Apply for Adoption!")

    click_link "Apply for Adoption!"

    expect(current_path).to eq("/adoptions/new")
    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Phone number")
    expect(page).to have_content("Description")

    page.check("apply_status_#{pet_1.id}")
    page.check("apply_status_#{pet_2.id}")

    fill_in 'Name',  with:     "Mike Dao"
    fill_in 'Address',  with:     "345 Mike Dao Rd."
    fill_in 'City',  with:     "Denver"
    fill_in 'State',  with:     "CO"
    fill_in 'Zip',  with:     "99999"
    fill_in 'phone_number',  with:     "123-456-7890"
    fill_in 'Description',  with:     "Mike Dao"
    click_button 'Submit My Application'

    expect(current_path).to eq('/favorites')
    expect(page).to have_content("Application Submitted Successfully!")
    
    within "#fav-list" do
      expect(page).to_not have_content("#{pet_1.name}")
      expect(page).to_not have_content("#{pet_2.name}")
      expect(page).to have_content("#{pet_3.name}")
    end
  end

  it "can alert for incomplete application" do
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

    pet_3 = shelter_1.pets.create(image: "Mr.cats-pic", name: "Mr. Cat", age: "9", sex: "male", description: "Has Russian accent")

    visit "/pets/#{pet_1.id}"

    click_link "Favorite"

    visit "/pets/#{pet_2.id}"

    click_link "Favorite"

    visit "/pets/#{pet_3.id}"

    click_link "Favorite"

    visit "/favorites"

    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")
    expect(page).to have_link("Apply for Adoption!")

    click_link "Apply for Adoption!"

    expect(current_path).to eq("/adoptions/new")
    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Phone number")
    expect(page).to have_content("Description")

    page.check("apply_status_#{pet_1.id}")
    page.check("apply_status_#{pet_2.id}")

    fill_in 'Name',  with:     "Mike Dao"
    fill_in 'Address',  with:     "345 Mike Dao Rd."
    fill_in 'City',  with:     "Denver"
    fill_in 'State',  with:     "CO"
    fill_in 'Zip',  with:     "99999"
    fill_in 'Description',  with:     "Mike Dao"
    click_button 'Submit My Application'

    expect(current_path).to eq('/adoptions/new')
    expect(page).to have_content("All fields required to continue!")

  end
end
