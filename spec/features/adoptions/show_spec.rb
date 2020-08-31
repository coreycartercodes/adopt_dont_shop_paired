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

    adoption_1 = Adoption.create(name: "Mike Dao", address: "345 Mike Dao Rd.", city: "Denver", state: "CO", zip: "99999", phone_number: "123-456-7890", description: "Mike Dao", pets: [pet_1, pet_2, pet_3])

    visit "/adoptions/#{adoption_1.id}"

    expect(page).to have_content("#{adoption_1.name}")
    expect(page).to have_content("#{adoption_1.address}")
    expect(page).to have_content("#{adoption_1.city}")
    expect(page).to have_content("#{adoption_1.state}")
    expect(page).to have_content("#{adoption_1.zip}")
    expect(page).to have_content("#{adoption_1.phone_number}")
    expect(page).to have_content("#{adoption_1.description}")
    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("#{pet_3.name}")

end
end
