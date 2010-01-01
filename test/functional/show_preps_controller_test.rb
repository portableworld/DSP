require 'test_helper'

class ShowPrepsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_preps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_prep" do
    assert_difference('ShowPrep.count') do
      post :create, :show_prep => { }
    end

    assert_redirected_to show_prep_path(assigns(:show_prep))
  end

  test "should show show_prep" do
    get :show, :id => show_preps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => show_preps(:one).to_param
    assert_response :success
  end

  test "should update show_prep" do
    put :update, :id => show_preps(:one).to_param, :show_prep => { }
    assert_redirected_to show_prep_path(assigns(:show_prep))
  end

  test "should destroy show_prep" do
    assert_difference('ShowPrep.count', -1) do
      delete :destroy, :id => show_preps(:one).to_param
    end

    assert_redirected_to show_preps_path
  end
end
