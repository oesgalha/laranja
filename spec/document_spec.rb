require 'spec_helper'

shared_examples 'a cpf generator' do |cpf|
  describe 'and' do
    it 'return a string' do
      expect(cpf).to be_a_kind_of(String)
    end

    it 'return a string with 11 characters' do
      expect(cpf.size).to eq(11)
    end

    it 'return a valid cpf' do
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
      expect(cpf[-2].to_i).to eq(v1)
      expect(cpf[-1].to_i).to eq(v2)
    end
  end
end

describe Laranja::Document do
  describe '#cpf' do
    it_behaves_like 'a cpf generator', Laranja::Document.cpf
    it_behaves_like 'a cpf generator', Laranja::Document.cpf(:ce)
    it_behaves_like 'a cpf generator', Laranja::Document.cpf(:BA)
    it_behaves_like 'a cpf generator', Laranja::Document.cpf('rj')
    it_behaves_like 'a cpf generator', Laranja::Document.cpf('RS')
    it_behaves_like 'a cpf generator', Laranja::Document.cpf(:sp)

    it 'has the UF digit if an UF is specified' do
      expect(Laranja::Document.cpf(:ce)[-3].to_i).to eq(3)
      expect(Laranja::Document.cpf(:BA)[-3].to_i).to eq(5)
      expect(Laranja::Document.cpf('rj')[-3].to_i).to eq(7)
      expect(Laranja::Document.cpf('RS')[-3].to_i).to eq(0)
      expect(Laranja::Document.cpf(:sp)[-3].to_i).to eq(8)
    end
  end

  describe '#formatted_cpf' do
    it_behaves_like 'a cpf generator', Laranja::Document.formatted_cpf.gsub(/\D+/, '')
    it 'return a formatted cpf string' do
      expect(Laranja::Document.formatted_cpf).to match(/\d{3}\.\d{3}\.\d{3}-\d{2}/)
    end
  end

  describe '#rg' do
    it 'return a string' do
      expect(Laranja::Document.rg).to be_a_kind_of(String)
    end

    it 'return a string with 9 characters' do
      expect(Laranja::Document.rg.size).to eq(9)
    end

    it 'return a string with numbers only' do
      expect(Laranja::Document.rg).not_to match(/\D/)
    end
  end

  describe '#formatted_rg' do
    it 'return a string' do
      expect(Laranja::Document.formatted_rg).to be_a_kind_of(String)
    end

    it 'return a string with 9 characters' do
      expect(Laranja::Document.formatted_rg.size).to eq(12)
    end

    it 'return a string with numbers only' do
      expect(Laranja::Document.formatted_rg).to match(/\d{2}\.\d{3}\.\d{3}-\d{1}/)
    end
  end

end