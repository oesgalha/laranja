require 'spec_helper'

shared_examples 'non empty string generator' do |str|
  describe 'and' do
    it 'return a string' do
      expect(str).to be_a_kind_of(String)
    end

    it 'returns a non empty string' do
      expect(str).not_to be_empty
    end
  end
end

describe Laranja::Address do
  describe '#uf' do
    it_behaves_like 'non empty string generator', Laranja::Address.uf
  end

  describe '#uf_abbr' do
    it_behaves_like 'non empty string generator', Laranja::Address.uf_abbr
    it 'returns a 2 characters string' do
      expect(Laranja::Address.uf_abbr.size).to eq(2)
    end
  end

  describe '#formatted_cep' do
    it_behaves_like 'non empty string generator', Laranja::Address.formatted_cep

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
    it_behaves_like 'non empty string generator', Laranja::Address.cep

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

  describe '#city' do
    it_behaves_like 'non empty string generator', Laranja::Address.city
  end

  describe '#street' do
    it_behaves_like 'non empty string generator', Laranja::Address.street
  end

  describe '#district' do
    it_behaves_like 'non empty string generator', Laranja::Address.district
  end

  describe '#secondary' do
    it_behaves_like 'non empty string generator', Laranja::Address.secondary
  end

  describe '#number' do
    it_behaves_like 'non empty string generator', Laranja::Address.number
    it 'returns a number only string' do
      expect(Laranja::Address.number).to match(/\d+/)
    end
  end
end