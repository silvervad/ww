require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:pupkin)
  end
  
  # Check that flash after invalid login dissapear on the next page
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  # # User login scenario with redirect to user profile
  # # Signup enabled version
  # test "login with valid information followed by logout" do
  #   get login_path
  #   post login_path, session: { email: @user.email, password: 'password' }
  #   assert is_logged_in?
  #   assert_redirected_to @user
  #   follow_redirect!
  #   assert_template 'users/show'
  #   assert_select "a[href=?]", login_path, count: 0
  #   assert_select "a[href=?]", logout_path
  #   delete logout_path
  #   assert_not is_logged_in?
  #   assert_redirected_to root_url
  #   follow_redirect!
  #   # assert_select "a[href=?]", login_path
  #   assert_select "a[href=?]", logout_path,      count: 0
  #   assert_select "a[href=?]", user_path(@user), count: 0
  # end
  
  # User login scenario with redirect to user profile
  # Signup disabled version
  test "login with valid informationt" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    # assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    # assert_select "a[href=?]", user_path(@user), count: 0
  end
  
  # User login scenario from the spot with redirect back
  # test "login via redirect from spot" do
  #   @country = countries(:egypt)
  #   @spot = spots(:somabay)
  #   get country_spot_path(@country, @spot)
  #   assert_template 'spots/show'
  #   # post login_path, session: { email: @user.email, password: 'password' }
  #   # assert_redirected_to @user
  #   # follow_redirect!
  #   # assert_template 'users/show'
  #   # assert_select "a[href=?]", login_path, count: 0
  #   # assert_select "a[href=?]", logout_path
  # end
  
end
