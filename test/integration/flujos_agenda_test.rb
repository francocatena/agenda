require 'test_helper'

class FlujosAgendaTest < ActionDispatch::IntegrationTest
  test 'ingresar y ver personas y eventos' do
    get '/'
    assert_response :success

    post_via_redirect '/sesion', sesion: {
      nombre: personas(:anakin).nombre,
      password: '123'
    }

    assert_equal '/personas', path

    get '/eventos'
    assert_response :success
    assert assigns(:eventos)
  end
end
