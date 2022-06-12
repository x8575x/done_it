require "test_helper"

class User::GetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_gets_index_url
    assert_response :success
  end
end
