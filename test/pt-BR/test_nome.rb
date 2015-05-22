require 'test_helper'

class TestNome < MiniTest::Test
  def setup
    Laranja.load('pt-BR')
  end

  def test_nome
    nome = Laranja::Nome.nome

    assert_kind_of String, nome
    assert_operator nome.split.size, :>=, 2
    assert_operator nome.split.size, :<=, 3
  end

  def test_nome_with_parameters
    n = 1 + rand(3)
    nome = Laranja::Nome.nome(n)

    assert_kind_of String, nome
    assert_operator nome.split.size, :>=, n + 1
    assert_operator nome.split.size, :<=, n + 2
  end

  def test_primeiro_nome
    nome = Laranja::Nome.primeiro_nome

    assert_kind_of String, nome
    assert_equal 1, nome.split.size
  end

  def test_sobrenome
    nome = Laranja::Nome.sobrenome

    assert_kind_of String, nome
    assert_equal 1, nome.split.size
  end  
end
