require 'test_helper'

class Admin::ChecksControllerTest < ActionController::TestCase
  setup do
    @admin_check = admin_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_check" do
    assert_difference('Admin::Check.count') do
      post :create, admin_check: { date: @admin_check.date, month: @admin_check.month, year: @admin_check.year }
    end

    assert_redirected_to admin_check_path(assigns(:admin_check))
  end

  test "should show admin_check" do
    get :show, id: @admin_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_check
    assert_response :success
  end

  test "should update admin_check" do
    patch :update, id: @admin_check, admin_check: { date: @admin_check.date, month: @admin_check.month, year: @admin_check.year }
    assert_redirected_to admin_check_path(assigns(:admin_check))
  end

  test "should destroy admin_check" do
    assert_difference('Admin::Check.count', -1) do
      delete :destroy, id: @admin_check
    end

    assert_redirected_to admin_checks_path
  end
end
