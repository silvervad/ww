require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # Signup disabled during MVP
  test "signup should be disabled" do
    assert_raises NameError do
      get signup_path
    end
  end

  # Check that invalid User input is not saved to the db
  # disabled since signup is disabled
  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'User.count' do
  #     post users_path, user: { name:  "",
  #                             email: "user@invalid",
  #                             password:              "foo",
  #                             password_confirmation: "bar" }
  #   end
  #   assert_template 'users/new'
  # end
  

  # Check that valid User input is saved to the db
  # disabled since signup is disabled
  # test "valid signup information" do
  #   get signup_path
  #   assert_difference 'User.count', 1 do
  #     post_via_redirect users_path, user: { name:  "Example User",
  #                                           email: "user@example.com",
  #                                           password:              "password",
  #                                           password_confirmation: "password" }
  #   end
  #   assert_template 'users/show'
  # end
end