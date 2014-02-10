require 'spec_helper'

describe Laranja::Gender do
  describe '#gender' do
    it 'returns a string' do
      expect(Laranja::Gender.gender).to be_a_kind_of(String)
    end

    it 'returns a non empty string' do
      expect(Laranja::Gender.gender).not_to be_empty
    end
  end

  describe '#abbr' do
    it 'returns a string' do
      expect(Laranja::Gender.abbr).to be_a_kind_of(String)
    end

    it 'returns an 1 character string' do
      expect(Laranja::Gender.abbr.size).to eq(1)
    end
  end
end