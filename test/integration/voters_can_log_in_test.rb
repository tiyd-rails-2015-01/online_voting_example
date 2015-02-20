require 'test_helper'

class VotersCanLogInTest < ActionDispatch::IntegrationTest
  test "voter can log in with correct log in information" do
    get log_in_path
    post log_in_path, email: "thisisnotcorrect@email.com", password: "wrong"
    refute is_logged_in?
    assert_template "sessions/new"
    Voter.create(name: "Joe", email: "joe.boring@example.com", password: "password")
    post log_in_path, email: "joe.boring@example.com", password: "password"
    assert is_logged_in?
  end
end
