require 'test_helper'

class LogprosControllerTest < ActionController::TestCase
  setup do
    @logpro = logpros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logpros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logpro" do
    assert_difference('Logpro.count') do
      post :create, logpro: { estado: @logpro.estado, fechaC: @logpro.fechaC, fechaM: @logpro.fechaM, meta: @logpro.meta, peorE: @logpro.peorE, proceso_id: @logpro.proceso_id, valor: @logpro.valor, valorP: @logpro.valorP }
    end

    assert_redirected_to logpro_path(assigns(:logpro))
  end

  test "should show logpro" do
    get :show, id: @logpro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logpro
    assert_response :success
  end

  test "should update logpro" do
    patch :update, id: @logpro, logpro: { estado: @logpro.estado, fechaC: @logpro.fechaC, fechaM: @logpro.fechaM, meta: @logpro.meta, peorE: @logpro.peorE, proceso_id: @logpro.proceso_id, valor: @logpro.valor, valorP: @logpro.valorP }
    assert_redirected_to logpro_path(assigns(:logpro))
  end

  test "should destroy logpro" do
    assert_difference('Logpro.count', -1) do
      delete :destroy, id: @logpro
    end

    assert_redirected_to logpros_path
  end
end
