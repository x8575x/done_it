require "test_helper"

class User::ReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_readings_index_url
    assert_response :success
  end
end
