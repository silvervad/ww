require 'rails_helper'

RSpec.describe "spots/show", :type => :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :name => "Name",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
