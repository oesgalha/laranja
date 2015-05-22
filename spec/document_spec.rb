require 'spec_helper'

describe Laranja::Document do

  subject { Laranja::Document }

  it '#cpf' do
    subject.must_respond_to :cpf
    cpf = subject.cpf
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
    cpf[-2].to_i.must_equal v1
    cpf[-1].to_i.must_equal v2
  end

  it '#cpf(uf)' do
    subject.cpf(:ce)[-3].must_equal '3'
    subject.cpf(:BA)[-3].must_equal '5'
    subject.cpf('rj')[-3].must_equal '7'
    subject.cpf('RS')[-3].must_equal '0'
    subject.cpf(:sp)[-3].must_equal '8'
  end

  it '#formatted_cpf' do
    subject.must_respond_to :formatted_cpf
    cpf = subject.formatted_cpf
    cpf.must_be_kind_of String
    cpf.must_match /\d{3}\.\d{3}\.\d{3}-\d{2}/
  end

  it '#rg' do
    subject.must_respond_to :rg
    rg = subject.rg
    rg.must_be_kind_of String
    rg.size.must_equal 9
    rg.wont_match /\D/
  end

  it '#formatted_rg' do
    subject.must_respond_to :formatted_rg
    rg = subject.formatted_rg
    rg.must_be_kind_of String
    rg.size.must_equal 12
    rg.must_match /\d{2}\.\d{3}\.\d{3}-\d{1}/
  end
end
