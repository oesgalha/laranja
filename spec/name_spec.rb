require 'spec_helper'

shared_examples 'a name generator' do |name|
  describe 'and' do
    it 'returns a string' do
      expect(name).to be_a_kind_of(String)
    end

    it 'returns a string with only one word' do
      expect(name.split.size).to eq(1)
    end
  end
end

describe Laranja::Name do
  describe '#name' do

    let(:n) { 1 + rand(3) }

    it 'returns a string' do
      expect(Laranja::Name.name).to be_a_kind_of(String)
      expect(Laranja::Name.name(2)).to be_a_kind_of(String)
    end

    it 'returns a first name and a last name' do
      expect(Laranja::Name.name.split.size).to be_between(2, 3)
    end

    it 'returns N last names when specified' do
      expect(Laranja::Name.name(n).split.size).to be_between(n + 1, n + 2)
    end
  end

  describe '#first_name' do
    it_behaves_like 'a name generator', Laranja::Name.first_name
  end

  describe '#last_name' do
    it_behaves_like 'a name generator', Laranja::Name.last_name
  end

  describe '#strfname' do

    let(:n) { 1 + rand(3) }

    it_behaves_like 'a name generator', Laranja::Name.strfname(0)
    it_behaves_like 'a name generator', Laranja::Name.strfname(1, false, false)
    it_behaves_like 'a name generator', Laranja::Name.strfname(0, true, false)

    it 'returns N last names when specified' do
      expect(Laranja::Name.strfname(n).split.size).to eq(n + 1)
    end

    it 'returns N last names plus suffix when specified' do
      expect(Laranja::Name.strfname(n, true).split.size).to eq(n + 2)
    end
  end
end