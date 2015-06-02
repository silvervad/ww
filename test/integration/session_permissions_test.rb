require 'test_helper'

class SessionPermissionsTest < ActionDispatch::IntegrationTest
  
  def setup
    @country = countries(:egypt)
    @spot = spots(:somabay)
  end
  
  
  # SPOTS
  ##################################3
  
  # Should redirect back to spot if trying to edit without login
  test "can NOT access Spot.edit without login" do
    get edit_country_spot_path(@country, @spot)
    assert_redirected_to country_spot_path(@country, @spot)
  end
  
  # Should redirect back to spot if trying to update without login
  test "can NOT access Spot.update without login" do
    patch country_spot_path(@country, @spot)
    assert_redirected_to country_spot_path(@country, @spot)
  end
  
  # Should redirect back to spot if trying to destroy without login
  test "can NOT access Spot.destroy without login" do
    delete country_spot_path(@country, @spot)
    assert_redirected_to country_spot_path(@country, @spot)
  end
  
  # Should redirect to root if going to new without login
  test "can NOT access Spot.new without login" do
    get new_country_spot_path(@country, @spot)
    assert_redirected_to root_path
  end
  
  # Should redirect to root if to create spot without login
  test "can NOT access Spot.create without login" do
    post country_spots_path(@country, @spot)
    assert_redirected_to root_path
  end
  
    # Should be able to Spot.destroy when logged in
  test "should be able to destroy spot when logged in" do
    @user = users(:pupkin)
    post login_path, session: { email: @user.email, password: 'password' }
    assert_difference "Spot.count", -1 do
      delete country_spot_path( @country, @spot )
    end
    assert_redirected_to country_path( @country )
  end 
  
  
end
