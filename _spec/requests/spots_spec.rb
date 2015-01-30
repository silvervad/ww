require 'rails_helper'

describe "Spots" do
  subject { page }

  describe "index page" do
  	
  	before { visit spots_path}

	it { should have_selector('h1', text: 'spots') }
	it { should have_title(full_title('Spots')) }
  
  end
end