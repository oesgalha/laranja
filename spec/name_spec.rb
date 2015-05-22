require 'spec_helper'

describe Laranja::Name do

  subject { Laranja::Name }

  it '#name' do
    subject.must_respond_to :name
    name = subject.name
    name.must_be_kind_of String
    name.split.size.must_be :>=, 2
    name.split.size.must_be :<=, 3
  end

  it '#name(n)' do
    n = 1 + rand(3)
    name = subject.name(n)
    name.must_be_kind_of String
    name.split.size.must_be :>=, n + 1
    name.split.size.must_be :<=, n + 2
  end

  it '#first_name' do
    subject.must_respond_to :first_name
    fname = subject.first_name
    fname.must_be_kind_of String
    fname.split.size.must_equal 1
  end

  it '#last_name' do
    subject.must_respond_to :last_name
    lname = subject.last_name
    lname.must_be_kind_of String
    lname.split.size.must_equal 1
  end

  it '#strf' do
    subject.must_respond_to :strf

    [
      '%female_first_name',
      '%male_first_name',
      '%last_name',
      '%male_suffix',
      '%female_title',
      '%male_title',
    ].each do |formatter|
      subject.strf(formatter).must_be_kind_of String
      subject.strf(formatter).split.size.must_equal 1
    end

    subject.strf('%male_first_name %last_name %last_name').split.size.must_equal 3
    subject.strf('%female_first_name %last_name %last_name').split.size.must_equal 3

    subject.strf('%male_first_name %last_name %male_suffix').split.size.must_equal 3
    subject.strf('%female_title %female_first_name %last_name %last_name').split.size.must_equal 4
  end
end
