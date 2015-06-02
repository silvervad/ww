require 'test_helper'

class SpotsControllerTest < ActionController::TestCase
  
  def setup
    @country = countries(:egypt)
    @spot = spots(:somabay)
  end
  
  # Spots.index should not respond
  test "should not respond to Spot.index" do
    assert_raises ActionController::UrlGenerationError do
      get :index
    end
  end
  
  # Spot.create
  
  # Spot.new
  
  # Spot.update
  

end
