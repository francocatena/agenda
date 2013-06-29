require 'test_helper'

class SesionControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:anakin)
  end
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get create' do
    post :create, sesion: { nombre: @persona.nombre, password: '123' }
    assert_redirected_to personas_url
  end

  test 'should get destroy' do
    delete :destroy
    assert_redirected_to root_url
  end
end
