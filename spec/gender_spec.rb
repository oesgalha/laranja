require 'spec_helper'

describe Laranja::Gender do

  subject { Laranja::Gender }

  it '#gender' do
    subject.must_respond_to :gender
    gender = subject.gender
    gender.must_be_kind_of String
    gender.wont_be_empty
  end

  it '#abbr' do
    subject.must_respond_to :abbr
    abbr = subject.abbr
    abbr.must_be_kind_of String
    abbr.size.must_equal 1
  end
end
