require "test_helper"

class Admin::LongsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_longs_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_longs_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_longs_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_longs_delete_url
    assert_response :success
  end
end
