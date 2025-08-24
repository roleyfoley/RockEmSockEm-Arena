require "test_helper"

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get competitors_index_url
    assert_response :success
  end

  test "should get show" do
    get competitors_show_url
    assert_response :success
  end
end
