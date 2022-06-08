require "test_helper"

class Admin::DifficultiesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_difficulties_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_difficulties_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_difficulties_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_difficulties_delete_url
    assert_response :success
  end
end
