require "test_helper"

class User::ReadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_reads_index_url
    assert_response :success
  end
end
