require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    if is_logged_in?
      assert_response :success
    else
      assert_redirected_to log_in_path
    end
  end

end
