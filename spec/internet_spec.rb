require 'spec_helper'

describe Laranja::Internet do

  subject { Laranja::Internet }

  it '#email' do
    subject.must_respond_to :email
    email = subject.email
    email.must_be_kind_of String
    email.must_match /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  end

  it '#email_for' do
    name = 'John Doe'
    subject.must_respond_to :email_for
    email = subject.email_for(name)
    email.must_be_kind_of String
    email.must_match /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
    email.must_include 'john'
    email.must_include 'doe'
  end

  it '#username' do
    subject.must_respond_to :username
    username = subject.username
    username.must_be_kind_of String
    username.wont_be_empty
  end

  it '#username_for' do
    name = 'John Doe'
    subject.must_respond_to :username_for
    username = subject.username_for(name)
    username.must_be_kind_of String
    username.must_include 'john'
    username.must_include 'doe'

    subject.username_for(name, ['-']).must_equal 'john-doe'
  end

  it '#password' do
    subject.must_respond_to :password
    password = subject.password
    password.must_be_kind_of String
    password.wont_match /\W/

    subject.password(32).size.must_be :>=, 32
    subject.password(64, 64).size.must_equal 64
  end
end
