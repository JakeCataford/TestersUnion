require 'test_helper'

class TokenControllerTest < ActionController::TestCase
  test "should get assign" do
    get :assign
    assert_response :success
  end

end
