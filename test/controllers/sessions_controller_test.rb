require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "login page loads" do
    get :new
    assert_response :success
  end
end
