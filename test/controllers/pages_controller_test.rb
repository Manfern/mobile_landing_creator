require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get pages_index,_url
    assert_response :success
  end

  test "should get show," do
    get pages_show,_url
    assert_response :success
  end

  test "should get create," do
    get pages_create,_url
    assert_response :success
  end

  test "should get destroy" do
    get pages_destroy_url
    assert_response :success
  end

end
