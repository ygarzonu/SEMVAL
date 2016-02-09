require 'test_helper'

class ProcesosControllerTest < ActionController::TestCase
  setup do
    @proceso = procesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:procesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceso" do
    assert_difference('Proceso.count') do
      post :create, proceso: { fechaC: @proceso.fechaC, fechaI: @proceso.fechaI, importancia: @proceso.importancia, meta: @proceso.meta, nombre: @proceso.nombre, objetivo: @proceso.objetivo }
    end

    assert_redirected_to proceso_path(assigns(:proceso))
  end

  test "should show proceso" do
    get :show, id: @proceso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceso
    assert_response :success
  end

  test "should update proceso" do
    patch :update, id: @proceso, proceso: { fechaC: @proceso.fechaC, fechaI: @proceso.fechaI, importancia: @proceso.importancia, meta: @proceso.meta, nombre: @proceso.nombre, objetivo: @proceso.objetivo }
    assert_redirected_to proceso_path(assigns(:proceso))
  end

  test "should destroy proceso" do
    assert_difference('Proceso.count', -1) do
      delete :destroy, id: @proceso
    end

    assert_redirected_to procesos_path
  end
end
