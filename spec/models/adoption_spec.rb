require 'rails_helper'

RSpec.describe Adoption, type: :model do
  describe "relationships" do
    it {should have_many(:pets).through(:adoption_pets)}
  end
end
