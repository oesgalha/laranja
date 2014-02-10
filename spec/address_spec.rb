require 'spec_helper'

describe Laranja::Address do
  describe '#uf' do
    it 'returns a string' do
      expect(Laranja::Address.uf).to be_a_kind_of(String)
    end

    it 'returns a non empty string' do
      expect(Laranja::Address.uf).not_to be_empty
    end
  end

  describe '#uf_abbr' do
    it 'returns a string' do
      expect(Laranja::Address.uf_abbr).to be_a_kind_of(String)
    end

    it 'returns a 2 characters string' do
      expect(Laranja::Address.uf_abbr.size).to eq(2)
    end
  end

  describe '#formatted_cep' do
    it 'returns a string' do
      expect(Laranja::Address.formatted_cep).to be_a_kind_of(String)
    end

    it 'returns an 8 characters string' do
      expect(Laranja::Address.formatted_cep.size).to eq(9)
    end

    it 'returns a number only string' do
      expect(Laranja::Address.formatted_cep).to match(/\d{5}-\d{3}/)
    end

    it 'has the UF digit if an UF is specified' do
      expect(Laranja::Address.formatted_cep(:ce)[0].to_i).to eq(6)
      expect(Laranja::Address.formatted_cep(:BA)[0].to_i).to eq(4)
      expect(Laranja::Address.formatted_cep('rj')[0].to_i).to eq(2)
      expect(Laranja::Address.formatted_cep('RS')[0].to_i).to eq(9)
      expect(Laranja::Address.formatted_cep(:sp)[0].to_i).to eq(1)
    end
  end

  describe '#cep' do
    it 'returns a string' do
      expect(Laranja::Address.cep).to be_a_kind_of(String)
    end

    it 'returns an 8 characters string' do
      expect(Laranja::Address.cep.size).to eq(8)
    end

    it 'returns a number only string' do
      expect(Laranja::Address.cep).to match(/\d{8}/)
    end

    it 'has the UF digit if an UF is specified' do
      expect(Laranja::Address.cep(:ce)[0].to_i).to eq(6)
      expect(Laranja::Address.cep(:BA)[0].to_i).to eq(4)
      expect(Laranja::Address.cep('rj')[0].to_i).to eq(2)
      expect(Laranja::Address.cep('RS')[0].to_i).to eq(9)
      expect(Laranja::Address.cep(:sp)[0].to_i).to eq(1)
    end
  end
end