require 'test_helper'

class ShellyUsersControllerTest < ActionController::TestCase
  setup do
    @shelly_user = shelly_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shelly_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shelly_user" do
    assert_difference('ShellyUser.count') do
      post :create, shelly_user: { activated: @shelly_user.activated, description: @shelly_user.description, email: @shelly_user.email, firstName: @shelly_user.firstName, lastName: @shelly_user.lastName }
    end

    assert_redirected_to shelly_user_path(assigns(:shelly_user))
  end

  test "should show shelly_user" do
    get :show, id: @shelly_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shelly_user
    assert_response :success
  end

  test "should update shelly_user" do
    patch :update, id: @shelly_user, shelly_user: { activated: @shelly_user.activated, description: @shelly_user.description, email: @shelly_user.email, firstName: @shelly_user.firstName, lastName: @shelly_user.lastName }
    assert_redirected_to shelly_user_path(assigns(:shelly_user))
  end

  test "should destroy shelly_user" do
    assert_difference('ShellyUser.count', -1) do
      delete :destroy, id: @shelly_user
    end

    assert_redirected_to shelly_users_path
  end
end
