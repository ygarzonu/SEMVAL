require 'test_helper'

class LogvarsControllerTest < ActionController::TestCase
  setup do
    @logvar = logvars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logvars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logvar" do
    assert_difference('Logvar.count') do
      post :create, logvar: { fechaD: @logvar.fechaD, valor: @logvar.valor, variable_id: @logvar.variable_id }
    end

    assert_redirected_to logvar_path(assigns(:logvar))
  end

  test "should show logvar" do
    get :show, id: @logvar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logvar
    assert_response :success
  end

  test "should update logvar" do
    patch :update, id: @logvar, logvar: { fechaD: @logvar.fechaD, valor: @logvar.valor, variable_id: @logvar.variable_id }
    assert_redirected_to logvar_path(assigns(:logvar))
  end

  test "should destroy logvar" do
    assert_difference('Logvar.count', -1) do
      delete :destroy, id: @logvar
    end

    assert_redirected_to logvars_path
  end
end
