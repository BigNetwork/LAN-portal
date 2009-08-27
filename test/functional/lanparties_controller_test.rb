require 'test_helper'

class LanpartiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lanparties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lanparty" do
    assert_difference('Lanparty.count') do
      post :create, :lanparty => { }
    end

    assert_redirected_to lanparty_path(assigns(:lanparty))
  end

  test "should show lanparty" do
    get :show, :id => lanparties(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lanparties(:one).to_param
    assert_response :success
  end

  test "should update lanparty" do
    put :update, :id => lanparties(:one).to_param, :lanparty => { }
    assert_redirected_to lanparty_path(assigns(:lanparty))
  end

  test "should destroy lanparty" do
    assert_difference('Lanparty.count', -1) do
      delete :destroy, :id => lanparties(:one).to_param
    end

    assert_redirected_to lanparties_path
  end
end
