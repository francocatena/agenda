require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:anakin)
    session[:persona_id] = @persona.id
  end

  test 'deberia obtener index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test 'deberia obtener new' do
    get :new
    assert_response :success
  end

test 'deberia crear persona' do
  assert_difference('Persona.count') do
    post :create, persona: {
      nombre: @persona.nombre,
      apellido: @persona.apellido,
      password: '123',
      password_confirmation: '123'
    }
  end

  assert_redirected_to persona_url(assigns(:persona))
end

  test 'deberia ver persona' do
    get :show, id: @persona
    assert_response :success
  end

  test 'deberia obtener editar' do
    get :edit, id: @persona
    assert_response :success
  end

  test 'deberia actualizar persona' do
    patch :update, id: @persona, persona: { nombre: @persona.nombre }
    assert_redirected_to persona_url(assigns(:persona))
  end

  test 'deberia eliminar persona' do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_url
  end
end
