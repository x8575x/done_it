require "test_helper"

class Admin::MysteriesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_mysteries_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_mysteries_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_mysteries_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_mysteries_delete_url
    assert_response :success
  end
end
