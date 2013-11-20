require 'test_helper'

class Admin::CheckControllerTest < ActionController::TestCase
  test "should get mark" do
    get :mark
    assert_response :success
  end

end
