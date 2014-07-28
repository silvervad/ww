require 'rails_helper'

RSpec.describe "spots/index", :type => :view do
  before(:each) do
    assign(:spots, [
      Spot.create!(
        :name => "Name",
        :latitude => "9.99",
        :longitude => "9.99"
      ),
      Spot.create!(
        :name => "Name",
        :latitude => "9.99",
        :longitude => "9.99"
      )
    ])
  end

  it "renders a list of spots" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
