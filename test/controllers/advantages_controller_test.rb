require 'test_helper'

class AdvantagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advantages_index_url
    assert_response :success
  end

  test "should get new" do
    get advantages_new_url
    assert_response :success
  end

  test "should get create" do
    get advantages_create_url
    assert_response :success
  end

  test "should get show" do
    get advantages_show_url
    assert_response :success
  end

  test "should get update" do
    get advantages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get advantages_destroy_url
    assert_response :success
  end

end
