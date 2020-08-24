require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a pet' do
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

    expect(page).to have_content("Delete Pet")

    click_link 'Delete Pet'

    expect(current_path).to eq("/pets/")
    expect(page).to_not have_content(pet_1.name)
  end
end
