require 'test_helper'

class StaffCanLogInTest < ActionDispatch::IntegrationTest
  test "staff can log in with correct log in information" do
    get log_in_path
    post log_in_path, email: "thisisnotcorrect@email.com", password: "wrong"
    refute is_logged_in?
    assert_template "sessions/new"
    Staff.create(name: "Bill", email: "bill.boring@example.com", password: "password")
    post log_in_path, email: "bill.boring@example.com", password: "password"
    assert is_logged_in?
  end
end
