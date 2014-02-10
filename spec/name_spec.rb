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

  describe '#strf' do

    let(:n) { 1 + rand(3) }

    it_behaves_like 'a name generator', Laranja::Name.strf('%female_first_name')
    it_behaves_like 'a name generator', Laranja::Name.strf('%male_first_name')
    it_behaves_like 'a name generator', Laranja::Name.strf('%last_name')
    it_behaves_like 'a name generator', Laranja::Name.strf('%male_suffix')
    it_behaves_like 'a name generator', Laranja::Name.strf('%female_title')
    it_behaves_like 'a name generator', Laranja::Name.strf('%male_title')

    it 'returns N last names when specified' do
      expect(Laranja::Name.strf("%male_first_name#{ ' %last_name' * n }").split.size).to eq(n + 1)
      expect(Laranja::Name.strf("%female_first_name#{ ' %last_name' * n }").split.size).to eq(n + 1)
    end

    it 'returns N last names plus suffix when specified' do
      expect(Laranja::Name.strf("%male_first_name#{ ' %last_name' * n } %male_suffix").split.size).to eq(n + 2)
    end

    it 'returns a title when specified' do
      expect(Laranja::Name.strf("%female_title %female_first_name#{ ' %last_name' * n }").split.size).to eq(n + 2)
    end
  end
end