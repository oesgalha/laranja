require 'test_helper'

class TestEndereco < MiniTest::Test
  def setup
    Laranja.load('pt-BR')
  end

  def test_uf
    uf = Laranja::Endereco.uf

    assert_kind_of String, uf
    refute_empty uf
  end

  def test_uf_sigla
    uf = Laranja::Endereco.uf_sigla

    assert_kind_of String, uf
    refute_empty uf
    assert_equal 2, uf.size
  end

  def test_cep
    cep = Laranja::Endereco.cep

    assert_kind_of String, cep
    assert_equal 8, cep.size
    assert_match /\d{8}/, cep
  end

  def test_cep_with_uf
    assert_equal '6', Laranja::Endereco.cep(:ce)[0]
    assert_equal '4', Laranja::Endereco.cep(:BA)[0]
    assert_equal '2', Laranja::Endereco.cep('rj')[0]
    assert_equal '9', Laranja::Endereco.cep('RS')[0]
  end

  def test_cep_formatado
    cep = Laranja::Endereco.cep_formatado

    assert_kind_of String, cep
    assert_equal 9, cep.size
    assert_match /\d{5}-\d{3}/, cep
  end

  def test_cep_formatado_with_uf
    assert_equal '6', Laranja::Endereco.cep_formatado(:ce)[0]
    assert_equal '4', Laranja::Endereco.cep_formatado(:BA)[0]
    assert_equal '2', Laranja::Endereco.cep_formatado('rj')[0]
    assert_equal '9', Laranja::Endereco.cep_formatado('RS')[0]
  end

  def test_cidade
    cidade = Laranja::Endereco.cidade

    assert_kind_of String, cidade
    refute_empty cidade
  end

  def test_rua
    rua = Laranja::Endereco.rua

    assert_kind_of String, rua
    refute_empty rua
  end

  def test_bairro
    bairro = Laranja::Endereco.bairro

    assert_kind_of String, bairro
    refute_empty bairro
  end

  def test_complemento
    complemento = Laranja::Endereco.complemento

    assert_kind_of String, complemento
    refute_empty complemento
  end
end
