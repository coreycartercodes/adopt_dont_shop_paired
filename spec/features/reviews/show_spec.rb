require 'rails_helper'

RSpec.describe "Shelters Show page", type: :feature do
  it "can see all reviews" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329",
                              id:           1)

    review_1 = shelter_1.reviews.create( title: "Best Place In Town",
                              rating: 3,
                              content: "We went here to find our new best friend and we were successful. Yay."
                              )

    review_2 = shelter_1.reviews.create( title: "Smells like cheese",
                              rating: 1,
                              content: "Do they ever clean this place?!",
                              image: "https://www.gannett-cdn.com/presto/2019/10/03/USAT/a027273c-4c89-44fb-b896-d0121a3814a8-ANIMALKIND_GUILTY_GOLDEN_DESK_THUMB.jpg")


    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)

    expect(page).to have_content(review_2.title)
    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_2.content)
    expect(page).to have_css("img[src*='#{review_2.image}']")
  end
end
