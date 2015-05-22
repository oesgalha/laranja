require 'test_helper'

class TestInternet < MiniTest::Test
  def setup
    Laranja.load('pt-BR')
  end

  def test_email
    email = Laranja::Internet.email

    assert_kind_of String, email
    assert_match /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, email
  end

  def test_email_with_parameter
    email = Laranja::Internet.email('John Doe')

    assert_kind_of String, email
    assert_match /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, email
    assert_includes email, 'john'
    assert_includes email, 'doe'
  end

  def test_username
    username = Laranja::Internet.username

    assert_kind_of String, username
    refute_empty username
  end

  def test_username_with_name_parameter
    username = Laranja::Internet.username('John Doe')

    assert_kind_of String, username
    refute_empty username
    assert_includes username, 'john'
    assert_includes username, 'doe'
  end

  def test_username_with_name_and_separator_parameter
    assert_equal 'john-doe', Laranja::Internet.username('John Doe', ['-'])
  end

  def test_password
    password = Laranja::Internet.password

    assert_kind_of String, password
    refute_match /\W/, password
  end

  def test_password_with_min
    assert_operator Laranja::Internet.password(32).size, :>=, 32
  end

  def test_password_with_min_and_max
    assert_equal 64, Laranja::Internet.password(64, 64).size
  end
end
