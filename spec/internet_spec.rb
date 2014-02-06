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
      expect(Laranja::Internet.strfemail(name)).to be_a_kind_of(String)
    end

    it 'returns a valid email' do
      expect(Laranja::Internet.strfemail(name)).to match(/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i)
    end

    it 'returns an email for the given name' do
      expect(Laranja::Internet.strfemail(name)).to include('john')
      expect(Laranja::Internet.strfemail(name)).to include('doe')
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
      expect(Laranja::Internet.strfusername(name)).to be_a_kind_of(String)
    end

    it 'returns an username for the given name' do
      expect(Laranja::Internet.strfusername(name)).to include('john')
      expect(Laranja::Internet.strfusername(name)).to include('doe')
    end

    it 'returns an username for the given name and separator' do
      expect(Laranja::Internet.strfusername(name, ['-'])).to eq('john-doe')
    end
  end
end