require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a review' do
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

    expect(page).to have_content("Delete Review")

    click_link 'Delete Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to_not have_content(review_1.title)
  end

  # it 'Deletes reviews when deleting a shelter' do
  #   shelter_1 = Shelter.create(name:       "New Hope Rescue",
  #                             address:     "208 Main St",
  #                             city:        "Denver",
  #                             state:       "CO",
  #                             zip:         "80329")
  #
  #   review_1 = shelter_1.reviews.create(
  #                       title:   "Git Gud",
  #                       rating:  "2",
  #                       content:    "Customer service is awful",
  #                     )
  #
  #   visit "/shelters/#{shelter_1.id}"
  #
  #   click_link 'Delete Shelter'
  #
  #   visit "/shelters/#{shelter_1.id}/reviews/"; expect(response.status).to eq(200)
  # end
end
