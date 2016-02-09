require 'test_helper'

class LogindsControllerTest < ActionController::TestCase
  setup do
    @logind = loginds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loginds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logind" do
    assert_difference('Logind.count') do
      post :create, logind: { estado: @logind.estado, fechaC: @logind.fechaC, fechaM: @logind.fechaM, meta: @logind.meta, peorE: @logind.peorE, proceso_id: @logind.proceso_id, valor: @logind.valor, valorP: @logind.valorP }
    end

    assert_redirected_to logind_path(assigns(:logind))
  end

  test "should show logind" do
    get :show, id: @logind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logind
    assert_response :success
  end

  test "should update logind" do
    patch :update, id: @logind, logind: { estado: @logind.estado, fechaC: @logind.fechaC, fechaM: @logind.fechaM, meta: @logind.meta, peorE: @logind.peorE, proceso_id: @logind.indicaador_id, valor: @logind.valor, valorP: @logind.valorP }
    assert_redirected_to logind_path(assigns(:logind))
  end

  test "should destroy logind" do
    assert_difference('Logind.count', -1) do
      delete :destroy, id: @logind
    end

    assert_redirected_to loginds_path
  end
end
