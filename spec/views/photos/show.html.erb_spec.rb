require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :spot_id => 1,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Image/)
  end
end
