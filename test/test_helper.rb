ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in_as_staff?
    !session[:staff_id].nil?
  end

  def is_logged_in_as_voter?
    !session[:voter_id].nil?
  end

  def log_in_as_staff(staff)
    session[:staff_id] = staff.id
  end
  def log_in_as_voter(voter)
    session[:voter_id] = voter.id
  end

  def log_out
    get bills_path
    assert_select("form.button_to")
    delete log_out_path
    assert_redirected_to log_in_path
  end
end
