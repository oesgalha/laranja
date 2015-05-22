require 'test_helper'

class TestSexo < MiniTest::Test
  def setup
    Laranja.load('pt-BR')
  end

  def test_sexo
    sexo = Laranja::Sexo.sexo

    assert_kind_of String, sexo
    refute_empty sexo
  end

  def test_sigla
    sexo = Laranja::Sexo.sigla

    assert_kind_of String, sexo
    assert_equal 1, sexo.size
  end
end
