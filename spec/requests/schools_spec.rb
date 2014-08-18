require 'rails_helper'

describe "Schools" do

  describe "Index page" do

    it "should have the title 'Schools'" do
      visit '/schools'
      expect(page).to have_title("Wind & Waves | Schools")
    end
  end
end