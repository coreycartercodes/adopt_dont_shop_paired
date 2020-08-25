require 'rails_helper'

RSpec.describe "When I visit a shelter Show page", type: :feature do
  it "can update a review" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    review_1 = shelter_1.reviews.create(
                        title:   "Git Gud",
                        rating:  "2",
                        content:    "Customer service is awful",
                      )
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("Update Review")

    click_link 'Update Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{review_1.id}/edit")

    fill_in 'title',  with:     "Got better"

    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Got better")
    expect(page).to have_content("2")
    expect(page).to have_content("Customer service is awful")
  end

  describe 'When I visit the update review form by clicking a link on the show' do

    it 'I can not update an review without a title' do
      shelter_1 = Shelter.create(name:       "New Hope Rescue",
        address:     "208 Main St",
        city:        "Denver",
        state:       "CO",
        zip:         "80329")

        review_1 = shelter_1.reviews.create(
                            title:   "Git Gud",
                            rating:  "2",
                            content:    "Customer service is awful",
                          )

      visit "/shelters/#{shelter_1.id}"

      click_on 'Update Review'

      fill_in 'title',  with:     ""

      click_on 'Update Review'
      expect(page).to have_content("Title, rating, and content required to continue!")
    end
  end
end
