require 'test_helper'

class SpotLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @country = countries(:egypt)
    @spot = spots(:somabay)
  end
  
  # Should display logged user name if logged in
  # Should not dispat user name after logging off
  test "logged in user name" do
    @user = users(:pupkin)
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    get country_spot_path(@country, @spot)
    assert_select "div#info-bar", text: /#{@user.name}/, count: 1
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    get country_spot_path(@country, @spot)
    assert_select "div#info-bar", text: /#{@user.name}/, count: 0
  end
  
  # Should display navigation with spot.name and country links
  test "country link spot.name and page title" do
    get country_spot_path(@country, @spot)
    assert_response :success
    assert_select "a[href=?]", country_path(@country), count: 3
    assert_select "div#nav-text", count: 1, text: /#{@spot.name}/
    assert_select "title", /#{@country.name} | #{@spot.name}/
  end
  
end
