require 'rails_helper'

RSpec.describe "spots/new", :type => :view do
  before(:each) do
    assign(:spot, Spot.new(
      :name => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders new spot form" do
    render

    assert_select "form[action=?][method=?]", spots_path, "post" do

      assert_select "input#spot_name[name=?]", "spot[name]"

      assert_select "input#spot_latitude[name=?]", "spot[latitude]"

      assert_select "input#spot_longitude[name=?]", "spot[longitude]"
    end
  end
end
