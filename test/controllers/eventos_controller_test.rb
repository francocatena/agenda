require 'test_helper'

class EventosControllerTest < ActionController::TestCase
  setup do
    @evento = eventos(:one)
    @persona = personas(:anakin)
    session[:persona_id] = @persona.id
  end

  test 'deberia obtener index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventos)
  end

  test 'deberia obtener new' do
    get :new
    assert_response :success
  end

  test 'deberia crear evento' do
    assert_difference('Evento.count') do
      post :create, evento: {
        descripcion: @evento.descripcion,
        persona_id: @evento.persona_id
      }
    end

    assert_redirected_to evento_url(assigns(:evento))
  end

  test 'deberia ver evento' do
    get :show, id: @evento
    assert_response :success
  end

  test 'deberia obtener editar' do
    get :edit, id: @evento
    assert_response :success
  end

  test 'deberia actualizar evento' do
    patch :update, id: @evento, evento: {
      descripcion: @evento.descripcion,
      persona_id: @evento.persona_id
    }
    assert_redirected_to evento_url(assigns(:evento))
  end

  test 'deberia eliminar evento' do
    assert_difference('Evento.count', -1) do
      delete :destroy, id: @evento
    end

    assert_redirected_to eventos_url
  end
end
