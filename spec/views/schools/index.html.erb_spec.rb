require 'rails_helper'

RSpec.describe "schools/index", :type => :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :spot_id => 1,
        :sports => 2,
        :name => "Name",
        :latitude => "9.99",
        :longitude => "9.99",
        :link => "Link",
        :affiliation => 3
      ),
      School.create!(
        :spot_id => 1,
        :sports => 2,
        :name => "Name",
        :latitude => "9.99",
        :longitude => "9.99",
        :link => "Link",
        :affiliation => 3
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
