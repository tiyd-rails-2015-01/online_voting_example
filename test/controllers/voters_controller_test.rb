require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get :index
    if is_logged_in_as_voter?
      assert_response :success
    else
      assert_redirected_to log_in_path
    end
  end

  test "voter must have name, email and password" do
    log_in_as(@staff)
    assert_no_difference('Voter.count', 1) do
      Voter.create(password: "password")
    end
  end
end
