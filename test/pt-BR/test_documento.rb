require 'test_helper'

class TestDocumento < MiniTest::Test
  def setup
    Laranja.load('pt-BR')
  end

  def test_cpf
    assert_kind_of String, Laranja::Documento.cpf
  end

  def test_cpf_is_valid
    cpf = Laranja::Documento.cpf
    v1, v2 = 0, 0
    for i in 0..8
      v1 += cpf[i].to_i * (10 - i)
      v2 += cpf[i].to_i * (11 - i)
    end 
    v1 = v1 % 11
    if v1 < 2
      v1 = 0
    else
      v1 = 11 - v1
    end
    v2 += v1 * 2
    v2 = v2 % 11
    if v2 < 2
      v2 = 0
    else
      v2 = 11 - v2
    end
    assert_equal v1, cpf[-2].to_i
    assert_equal v2, cpf[-1].to_i
  end

  def test_cpf_with_arguments
    assert_equal '3', Laranja::Documento.cpf(:ce)[-3]
    assert_equal '5', Laranja::Documento.cpf(:BA)[-3]
    assert_equal '7', Laranja::Documento.cpf('rj')[-3]
    assert_equal '0', Laranja::Documento.cpf('RS')[-3]
  end

  def test_cpf_formatado
    cpf = Laranja::Documento.cpf_formatado

    assert_kind_of String, cpf
    assert_match /\d{3}\.\d{3}\.\d{3}-\d{2}/, cpf
  end

  def test_rg
    rg = Laranja::Documento.rg

    assert_kind_of String, rg
    assert_equal 9, rg.size
    refute_match /\D/, rg
  end

  def test_rg_formatado
    rg = Laranja::Documento.rg_formatado

    assert_kind_of String, rg
    assert_equal 12, rg.size
    assert_match /\d{2}\.\d{3}\.\d{3}-\d{1}/, rg
  end
end
