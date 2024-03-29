require "test_helper"

class Admin::PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pets_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_pets_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_pets_edit_url
    assert_response :success
  end
end
