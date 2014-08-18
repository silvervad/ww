require 'rails_helper'

describe "Spots" do

  describe "Index page" do

    it "should have the title 'Spots'" do
      visit '/spots'
      expect(page).to have_title("Wind & Waves | Spots")
    end
  end
end