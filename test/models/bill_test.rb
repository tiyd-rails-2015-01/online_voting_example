require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "can't load bills index if not logged in" do
    get :index
    assert_redirected_to log_in_path, flash[:notice]
  end
end
