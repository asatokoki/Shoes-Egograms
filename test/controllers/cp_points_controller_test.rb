require 'test_helper'

class CpPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cp_points_create_url
    assert_response :success
  end
end
