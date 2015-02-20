require 'test_helper'

class UsersCanLogOutTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
    @voter = voters(:one)
  end

  test "voters and staff can log out" do
    Staff.create(name: "Bill", email: "bill.boring@example.com", password: "password")
    post log_in_path, email: "bill.boring@example.com", password: "password"
    log_out
    Voter.create(name: "Joe", email: "joe.boring@example.com", password: "password")
    post log_in_path, email: "joe.boring@example.com", password: "password"
    log_out
  end
end
