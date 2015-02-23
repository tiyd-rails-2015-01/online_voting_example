require 'test_helper'

class StaffCanCreateVotersTest < ActionDispatch::IntegrationTest
  test "staff can log in and create voters" do
    get log_in_path
    post log_in_path, email: "bill.boring@example.com", password: "password"
    assert is_logged_in_as_staff?
    follow_redirect!
    get new_voter_path
    assert_select("form")
    assert_difference('Voter.count', 1) do
      post voters_path, voter: {name: "Average Joe", email: "aj@freedom.com", password: "password"}
      #Voter.create(name: "Average Joe", email: "aj@freedom.com", password: "password")
      assert_redirected_to Voter.last
    end
  end
end
