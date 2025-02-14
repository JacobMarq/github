# encoding: utf-8

require 'spec_helper'
require 'github_api2/core_ext/hash'

describe Github::ParameterFilter, '#filter!' do
  let(:hash) {  { :a => { :b => { :c => 1 } } }  }

  let(:klass) {
    Class.new do
      include Github::ParameterFilter
    end
  }

  subject(:instance) { klass.new }

  it 'removes unwanted keys from hash' do
    instance.filter!([:a], hash)
    expect(hash.deep_key?(:a)).to be true
    expect(hash.deep_key?(:b)).to be false
    expect(hash.deep_key?(:c)).to be false
  end

  it 'recursively filters inputs tree' do
    instance.filter!([:a, :b], hash)
    expect(hash.deep_key?(:c)).to be false
  end

  it 'filters inputs tree only on top level' do
    instance.filter!([:a, :b], hash, :recursive => false)
    expect(hash.deep_key?(:c)).to be true
  end

end # Github::ParameterFilter
