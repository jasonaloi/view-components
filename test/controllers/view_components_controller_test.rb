require 'test_helper'

class ViewComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get view_components_index_url
    assert_response :success
  end

  test "should get show" do
    get view_components_show_url
    assert_response :success
  end

end
