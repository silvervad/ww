require 'rails_helper'

RSpec.describe "photos/new", :type => :view do
  before(:each) do
    assign(:photo, Photo.new(
      :spot_id => 1,
      :image => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_spot_id[name=?]", "photo[spot_id]"

      assert_select "input#photo_image[name=?]", "photo[image]"
    end
  end
end
