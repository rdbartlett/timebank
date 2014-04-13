require 'test_helper'

class RendersControllerTest < ActionController::TestCase
  setup do
    @render = renders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:renders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create render" do
    assert_difference('Render.count') do
      post :create, render: {  }
    end

    assert_redirected_to render_path(assigns(:render))
  end

  test "should show render" do
    get :show, id: @render
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @render
    assert_response :success
  end

  test "should update render" do
    put :update, id: @render, render: {  }
    assert_redirected_to render_path(assigns(:render))
  end

  test "should destroy render" do
    assert_difference('Render.count', -1) do
      delete :destroy, id: @render
    end

    assert_redirected_to renders_path
  end
end
