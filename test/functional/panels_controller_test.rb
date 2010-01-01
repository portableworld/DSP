require 'test_helper'

class PanelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:panels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create panel" do
    assert_difference('Panel.count') do
      post :create, :panel => { }
    end

    assert_redirected_to panel_path(assigns(:panel))
  end

  test "should show panel" do
    get :show, :id => panels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => panels(:one).to_param
    assert_response :success
  end

  test "should update panel" do
    put :update, :id => panels(:one).to_param, :panel => { }
    assert_redirected_to panel_path(assigns(:panel))
  end

  test "should destroy panel" do
    assert_difference('Panel.count', -1) do
      delete :destroy, :id => panels(:one).to_param
    end

    assert_redirected_to panels_path
  end
end
