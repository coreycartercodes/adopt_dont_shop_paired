require 'rails_helper'
RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329",
                              id:           1)
    visit "/shelters/1"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
  it "can see shelter statistics" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329",
                              id:           1)

    pet_1 = shelter_1.pets.create(
                        name:   "Fido",
                        image:  "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg",
                        age:    "2",
                        sex:       "Male"
                      )

    pet_2 = shelter_1.pets.create( image:  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDXuKrIAVvsVmj0Tur6KgFmaycQaIJOQM6jw&usqp=CAU",
                        name:   "Marie",
                        age:    "12",
                        sex:    "Female"
                        )

    review_1 = shelter_1.reviews.create( title: "Best Place In Town",
                              rating: 4,
                              content: "We went here to find our new best friend and we were successful. Yay."
                              )

    review_2 = shelter_1.reviews.create( title: "Smells like cheese",
                              rating: 1,
                              content: "Do they ever clean this place?!",
                              image: "https://www.gannett-cdn.com/presto/2019/10/03/USAT/a027273c-4c89-44fb-b896-d0121a3814a8-ANIMALKIND_GUILTY_GOLDEN_DESK_THUMB.jpg")

    adoption_1 = Adoption.create(name: "Mike Dao", address: "345 Mike Dao Rd.", city: "Denver", state: "CO", zip: "99999", phone_number: "123-456-7890", description: "Mike Dao", pets: [pet_1, pet_2])

    adoption_2 = Adoption.create(name: "Tim Mitchell", address: "345 you hate to see it Rd.", city: "Denver", state: "CO", zip: "12345", phone_number: "123-456-7899", description: "You love to see it", pets: [pet_1])

    adoption_3 = Adoption.create(name: "Kat Scriver", address: "1234 You love to see it Blvd.", city: "Denver", state: "CO", zip: "53421", phone_number: "888-888-8888", description: "I'm a nice human.", pets: [pet_2])

    visit "/shelters/1"

    expect(page).to have_content("Total Pets in This Shelter: 2")
    expect(page).to have_content("Average Rating: 2.5")
    expect(page).to have_content("Total Adoptions: 3")
  end
end
