require "test_helper"

class User::RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get review" do
    get user_ranks_review_url
    assert_response :success
  end

  test "should get want" do
    get user_ranks_want_url
    assert_response :success
  end

  test "should get reading" do
    get user_ranks_reading_url
    assert_response :success
  end

  test "should get read" do
    get user_ranks_read_url
    assert_response :success
  end

  test "should get get" do
    get user_ranks_get_url
    assert_response :success
  end
end
