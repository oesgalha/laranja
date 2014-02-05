require 'spec_helper'

shared_examples 'a cpf generator' do |cpf|
  describe 'and' do
    it 'should return a string' do
      expect(cpf).to be_a_kind_of(String)
    end

    it 'should return a string with 11 characters' do
      expect(cpf.size).to eq(11)
    end

    it 'should return a valid cpf' do
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

describe Laranja::CPF do
  describe '#cpf' do
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf(:ce)
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf(:BA)
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf('rj')
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf('RS')
    it_behaves_like 'a cpf generator', Laranja::CPF.cpf(:sp)

    it 'has the UF digit if an UF is specified' do
      expect(Laranja::CPF.cpf(:ce)[-3].to_i).to eq(3)
      expect(Laranja::CPF.cpf(:BA)[-3].to_i).to eq(5)
      expect(Laranja::CPF.cpf('rj')[-3].to_i).to eq(7)
      expect(Laranja::CPF.cpf('RS')[-3].to_i).to eq(0)
      expect(Laranja::CPF.cpf(:sp)[-3].to_i).to eq(8)
    end
  end
end