require 'test_helper'

class CountryLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @country = countries(:egypt)
    @user = users(:pupkin)
  end
  
  # Should display New Spot for logged users
  test "show new spot for logged users" do
    post login_path, session: { email: @user.email, password: 'password' }
    get country_path ( @country )
    assert_select "a[href=?]", new_country_spot_path(@country), count: 1
  end
  
  # Should NOT display New Spot for logged users
  test "don't show new spot for not logged users" do
    get country_path ( @country )
    assert_select "a[href=?]", new_country_spot_path(@country), count: 0
  end
  
end
