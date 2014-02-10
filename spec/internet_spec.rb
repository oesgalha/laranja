require 'spec_helper'

describe Laranja::Internet do
  describe '#email' do
    it 'returns a string' do
      expect(Laranja::Internet.email).to be_a_kind_of(String)
    end

    it 'returns a valid email' do
      expect(Laranja::Internet.email).to match(/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i)
    end
  end

  describe '#strfemail' do

    let (:name) { 'John Doe' }

    it 'returns a string' do
      expect(Laranja::Internet.email_for(name)).to be_a_kind_of(String)
    end

    it 'returns a valid email' do
      expect(Laranja::Internet.email_for(name)).to match(/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i)
    end

    it 'returns an email for the given name' do
      expect(Laranja::Internet.email_for(name)).to include('john')
      expect(Laranja::Internet.email_for(name)).to include('doe')
    end
  end

  describe '#username' do
    it 'returns a string' do
      expect(Laranja::Internet.username).to be_a_kind_of(String)
    end

    it 'returns a non empty string' do
      expect(Laranja::Internet.username).not_to be_empty
    end
  end

  describe '#strfusername' do

    let (:name) { 'John Doe' }

    it 'returns a string' do
      expect(Laranja::Internet.username_for(name)).to be_a_kind_of(String)
    end

    it 'returns an username for the given name' do
      expect(Laranja::Internet.username_for(name)).to include('john')
      expect(Laranja::Internet.username_for(name)).to include('doe')
    end

    it 'returns an username for the given name and separator' do
      expect(Laranja::Internet.username_for(name, ['-'])).to eq('john-doe')
    end
  end

  describe '#password' do
    it 'returns a string' do
      expect(Laranja::Internet.password).to be_a_kind_of(String)
    end

    it 'returns an alphanumeric string' do
      expect(Laranja::Internet.password).not_to match(/\W/)
    end

    it 'returns a password with minimum length' do
      expect(Laranja::Internet.password(32).size).to be >= 32
    end

    it 'returns a password with minimum and maximum length' do
      expect(Laranja::Internet.password(64, 64).size).to eq(64)
    end
  end
end