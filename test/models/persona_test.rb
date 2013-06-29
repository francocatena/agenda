require 'test_helper'

class PersonaTest < ActiveSupport::TestCase
  setup do
    @persona = personas(:anakin)
  end

  test 'el nombre no puede estar en blanco' do
    @persona.nombre = ''

    assert @persona.invalid?
    assert @persona.errors[:nombre].include?(
      'no puede estar en blanco'
    )
  end
end
