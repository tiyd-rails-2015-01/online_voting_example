require 'test_helper'

class StaffCanCreateVotersTest < ActionDispatch::IntegrationTest
  test "staff can log in and create voters" do
    get log_in_path
    Staff.create(name: "Bill", email: "bill.boring@example.com", password: "password")
    post log_in_path, email: "bill.boring@example.com", password: "password"
    assert is_logged_in_as_staff?
    follow_redirect!
    get new_voter_path
    assert_difference('Voter.count', 1) do
      Voter.create(name: "Average Joe", email: "aj@freedom.com", password: "password")
    end
  end
end
