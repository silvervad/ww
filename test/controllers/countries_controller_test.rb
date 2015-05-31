require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  
  # should answer Country.index request
  test "should get Index" do
    get :index
    assert_response :success
  end
  
  # should NOT answer Country.new request
  test "should NOT get New" do
    assert_raises ActionController::UrlGenerationError do
      get :new
    end
  end
end
