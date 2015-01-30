require 'rails_helper'
require 'requests/all_static_pages'

describe "Schools" do
  subject { page }

  describe "index page" do
  	before { visit schools_path }

	it { should have_selector('h1', text: 'schools') }
	it { should have_title(full_title('Schools')) }

  end
end