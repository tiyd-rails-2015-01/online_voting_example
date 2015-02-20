require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:one)
    @staff = staffs(:one)
    @voter = voters(:one)
  end

  test "can't load bills index if not logged in" do
    get :index
    assert_redirected_to log_in_path, flash[:notice]
  end

  test "staff can edit or delete bills" do
    log_in_as_staff(@staff)
    get :index
    assert_select("a[href=?]", edit_bill_path(Bill.first))
    assert_select("a[data-confirm]")
  end

  test "voter can not edit or delete bills" do
    log_in_as_voter(@voter)
    get :index
    assert_select("a[href=?]", edit_bill_path(Bill.first), 0)
    assert_select("a[data-confirm]", 0)
  end

  test "voters and staff can log out" do
    assert_select("a[href=?]", log_out_path)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:bills)
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create bill" do
  #   assert_difference('Bill.count') do
  #     post :create, bill: { content: @bill.content, name: @bill.name }
  #   end
  #
  #   assert_redirected_to bill_path(assigns(:bill))
  # end
  #
  # test "should show bill" do
  #   get :show, id: @bill
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @bill
  #   assert_response :success
  # end
  #
  # test "should update bill" do
  #   patch :update, id: @bill, bill: { content: @bill.content, name: @bill.name }
  #   assert_redirected_to bill_path(assigns(:bill))
  # end
  #
  # test "should destroy bill" do
  #   assert_difference('Bill.count', -1) do
  #     delete :destroy, id: @bill
  #   end
  #
  #   assert_redirected_to bills_path
  # end
end
