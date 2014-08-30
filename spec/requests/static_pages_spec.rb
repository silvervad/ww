require 'rails_helper'

describe "Static pages" do
  subject { page }
  
  describe "home page" do

  	before { visit root_path }

	  it { should have_selector('h1', text: 'Wind & Waves') }
	  it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }


    it "should have the right links on the layout" do
      visit root_path
      click_link "Spots"
      expect(page).to have_title(full_title('Spots'))
      click_link "Schools"
      expect(page).to have_title(full_title('Schools'))

      visit root_path
      click_link "Sign up"
      expect(page).to have_title(full_title('Sign up'))
    end

  end

end