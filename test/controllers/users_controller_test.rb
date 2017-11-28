require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_attributes = {
        name:      "sam",
        password:  "private",
        password_confirmation: "private"
    }
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @input_attributes
      #post users_url, params: { user: { name: @user.name, password_digest: @user.password_digest } }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: @input_attributes
    #patch user_url(@user), params: { user: { name: @user.name, password_digest: @user.password_digest } }
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
