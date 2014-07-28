require 'rails_helper'

RSpec.describe "spots/edit", :type => :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :name => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders the edit spot form" do
    render

    assert_select "form[action=?][method=?]", spot_path(@spot), "post" do

      assert_select "input#spot_name[name=?]", "spot[name]"

      assert_select "input#spot_latitude[name=?]", "spot[latitude]"

      assert_select "input#spot_longitude[name=?]", "spot[longitude]"
    end
  end
end
