require 'rails_helper'

RSpec.describe "From Shelter Show Page", type: :feature do
  it "can create a new review" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    visit "/shelters/#{shelter_1.id}"

    click_link 'Add Review'
    expect(current_path).to eq("/shelters/#{shelter_1.id}/review")
    fill_in 'title', with: "This place rocks."
    fill_in 'rating',      with: 4
    fill_in 'content',     with: "This place has everything you need"
    fill_in 'image',       with: "https://www.gannett-cdn.com/presto/2020/03/26/PWES/b54dc23e-34f6-460e-8931-26ccc2f8677f-sh032620coronapets005.JPG?crop=6213,3495,x0,y389&width=3200&height=1801&format=pjpg&auto=webp"

    click_on "Add Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("This place rocks.")
    expect(page).to have_content(4)
    expect(page).to have_content("This place has everything you need")
    expect(page).to have_css("img[src*='https://www.gannett-cdn.com/presto/2020/03/26/PWES/b54dc23e-34f6-460e-8931-26ccc2f8677f-sh032620coronapets005.JPG?crop=6213,3495,x0,y389&width=3200&height=1801&format=pjpg&auto=webp']")
  end
end
