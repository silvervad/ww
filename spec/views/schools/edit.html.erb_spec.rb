require 'rails_helper'

RSpec.describe "schools/edit", :type => :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :spot_id => 1,
      :sports => 1,
      :name => "MyString",
      :latitude => "9.99",
      :longitude => "9.99",
      :link => "MyString",
      :affiliation => 1
    ))
  end

  it "renders the edit school form" do
    render

    assert_select "form[action=?][method=?]", school_path(@school), "post" do

      assert_select "input#school_spot_id[name=?]", "school[spot_id]"

      assert_select "input#school_sports[name=?]", "school[sports]"

      assert_select "input#school_name[name=?]", "school[name]"

      assert_select "input#school_latitude[name=?]", "school[latitude]"

      assert_select "input#school_longitude[name=?]", "school[longitude]"

      assert_select "input#school_link[name=?]", "school[link]"

      assert_select "input#school_affiliation[name=?]", "school[affiliation]"
    end
  end
end
