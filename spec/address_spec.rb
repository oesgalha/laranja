require 'spec_helper'

describe Laranja::Address do

  subject { Laranja::Address }

  it '#uf' do
    subject.must_respond_to :uf
    uf = subject.uf
    uf.must_be_kind_of String
    uf.wont_be_empty
  end

  it '#uf_abbr' do
    subject.must_respond_to :uf_abbr
    uf_short = subject.uf_abbr
    uf_short.must_be_kind_of String
    uf_short.size.must_equal 2
  end

  it '#formatted_cep' do
    subject.must_respond_to :formatted_cep
    cep = subject.formatted_cep
    cep.must_be_kind_of String
    cep.size.must_equal 9
    cep.must_match /\d{5}-\d{3}/
  end

  it '#formatted_cep(uf)' do
    subject.formatted_cep(:ce)[0].must_equal '6'
    subject.formatted_cep(:BA)[0].must_equal '4'
    subject.formatted_cep('rj')[0].must_equal '2'
    subject.formatted_cep('RS')[0].must_equal '9'
  end

  it '#cep' do
    subject.must_respond_to :cep
    cep = subject.cep
    cep.must_be_kind_of String
    cep.size.must_equal 8
    cep.must_match /\d{8}/
  end

  it '#cep(uf)' do
    subject.cep(:ce)[0].must_equal '6'
    subject.cep(:BA)[0].must_equal '4'
    subject.cep('rj')[0].must_equal '2'
    subject.cep('RS')[0].must_equal '9'
  end

  it '#city' do
    subject.must_respond_to :city
    city = subject.city
    city.must_be_kind_of String
    city.wont_be_empty
  end

  it '#street' do
    subject.must_respond_to :street
    street = subject.street
    street.must_be_kind_of String
    street.wont_be_empty
  end

  it '#district' do
    subject.must_respond_to :district
    district = subject.district
    district.must_be_kind_of String
    district.wont_be_empty
  end

  it '#secondary' do
    subject.must_respond_to :secondary
    secondary = subject.secondary
    secondary.must_be_kind_of String
    secondary.wont_be_empty
  end

  it '#number' do
    subject.must_respond_to :number
    number = subject.number
    number.must_be_kind_of String
    number.must_match /\d+/
  end
end
