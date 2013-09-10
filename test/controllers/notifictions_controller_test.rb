require 'test_helper'

class NotifictionsControllerTest < ActionController::TestCase
  setup do
    @notifiction = notifictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notifiction" do
    assert_difference('Notifiction.count') do
      post :create, notifiction: { msg: @notifiction.msg, sender: @notifiction.sender, unread: @notifiction.unread, user_id: @notifiction.user_id }
    end

    assert_redirected_to notifiction_path(assigns(:notifiction))
  end

  test "should show notifiction" do
    get :show, id: @notifiction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notifiction
    assert_response :success
  end

  test "should update notifiction" do
    patch :update, id: @notifiction, notifiction: { msg: @notifiction.msg, sender: @notifiction.sender, unread: @notifiction.unread, user_id: @notifiction.user_id }
    assert_redirected_to notifiction_path(assigns(:notifiction))
  end

  test "should destroy notifiction" do
    assert_difference('Notifiction.count', -1) do
      delete :destroy, id: @notifiction
    end

    assert_redirected_to notifictions_path
  end
end
