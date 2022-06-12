require "test_helper"

class User::WantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_wants_index_url
    assert_response :success
  end
end
