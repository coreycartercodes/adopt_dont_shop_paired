require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a shelter' do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    visit "/shelters/#{shelter_1.id}"

    click_link 'Delete Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to_not have_link('Delete Shelter')
  end

  it 'I can not delete a shelter if it has pets' do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    pet_1 = shelter_1.pets.create(
                        name:   "Fido",
                        image:  "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg",
                        age:    "2",
                        sex:       "Male",
                        adoption_status: "Pending-1"
                      )

    visit "/shelters/#{shelter_1.id}"

    click_link('Delete Shelter')

    expect(page).to have_content("This shelter has pending adoptions and cannot be deleted.")
  end
end
