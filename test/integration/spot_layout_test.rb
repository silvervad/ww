require 'test_helper'

class SpotLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @country = countries(:egypt)
    @spot = spots(:somabay)
  end
  
  # Should display logged user name and admin links if logged in
  # Should not display user name nor admin links after logging off

  # test "logged in user name" do
  #   @user = users(:pupkin)
  #   get login_path
  #   assert_response :success
  #   post login_path, session: { email: @user.email, password: 'password' }
  #   assert is_logged_in?
  #   get country_spot_path(@country, @spot)
  #   assert_select "div#info-bar", text: /#{@user.name}/, count: 1
  #   assert_select "a[href=?]", logout_path
  #   assert_select "a[href=?][data-method=?]", country_spot_path(@country, @spot), 'delete', text: 'Destroy', count: 1
  #   assert_select "a[href=?]", edit_country_spot_path(@country, @spot), text: 'Edit', count: 1
  
  #   delete logout_path
  #   assert_not is_logged_in?
  #   get country_spot_path(@country, @spot)
  #   assert_select 'div#info-bar', text: /#{@user.name}/, count: 0
  #   assert_select "a[href=?][data-method=?]", country_spot_path(@country, @spot), 'delete', text: 'Destroy', count: 0
  #   assert_select "a[href=?]", edit_country_spot_path(@country, @spot), text: 'Edit', count: 0
  # end
  
  # # Should display navigation with spot.name and country links
  # test "country link spot name and page title" do
  #   get country_spot_path(@country, @spot)
  #   assert_response :success
  #   assert_select "a[href=?]", country_path(@country), count: 2
  #   assert_select "div#nav-text", count: 1, text: /#{@spot.name}/
  #   assert_select "title", /#{@country.name} | #{@spot.name}/
  # end
  
  # # Should display Sports and Schools partials
  # test "should display sports partial" do
  #   get country_spot_path(@country, @spot)
  #   assert_select "ul.info-partial", count: 2
  #   assert_select "div.info-title", text: "Sports"
  #   assert_select "div.info-title", text: "Schools"
  # end
  
  
  # # Spot page should show proper navigation
  # test "should show proper navigation" do
  #   get country_spot_path(@country, @spot)
  #   assert_select "div#button-up", title: "Up"
  #   assert_select "div#button-home", title: "Home"
  #   assert_select "div#button-toggle-map", title: "Photos"
  #   assert_select "div#button-toggle-info", title: "Close Info"
  #   assert_select "div#button-toggle-nav", title: "Close Navigation"
  # end
  
  # Spot page should have photos and map divs, and infobar
  test "should have photos and map divs" do
    get country_spot_path( @country, @spot )
    get country_path (@country)
    # assert_select "div#spot-map-canvas"
    # assert_select "div#rama-canvas"
    assert_select "div#info-bar"
  end
  
end
