require 'rails_helper'

RSpec.describe "As a visitor to an adoptions show page", type: :feature do
  it "can show all information" do
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

    visit "/pets/#{pet_1.id}/applications"

    expect(page).to_not have_link("Mike Dao")
    expect(page).to have_content("There are no pending applications for this furry friend... yet.")

    adoption_1 = Adoption.create(name: "Mike Dao", address: "345 Mike Dao Rd.", city: "Denver", state: "CO", zip: "99999", phone_number: "123-456-7890", description: "Mike Dao", pets: [pet_1, pet_2, pet_3])
    adoption_2 = Adoption.create(name: "Tim Mitchell", address: "345 you hate to see it Rd.", city: "Denver", state: "CO", zip: "12345", phone_number: "123-456-7899", description: "You love to see it", pets: [pet_1])

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_link("View All Applications")

    click_link "View All Applications"

    expect(current_path).to eq("/pets/#{pet_1.id}/applications")
    expect(page).to have_link("#{adoption_1.name}")
    expect(page).to have_link("#{adoption_2.name}")

    click_link "#{adoption_2.name}"

    expect(current_path).to eq("/adoptions/#{adoption_2.id}")
    expect(page).to have_content("#{adoption_2.name}")
    expect(page).to have_content("#{adoption_2.address}")
    expect(page).to have_content("#{adoption_2.city}")
    expect(page).to have_content("#{adoption_2.state}")
    expect(page).to have_content("#{adoption_2.zip}")
    expect(page).to have_content("#{adoption_2.phone_number}")
    expect(page).to have_content("#{adoption_2.description}")
  end
end
