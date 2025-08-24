require "test_helper"

class FightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fights_index_url
    assert_response :success
  end
end
