require 'spec_helper'
require 'statistical/rng/normal'
require 'statistical/distribution/normal'

describe Statistical::Rng::Normal do

  describe '.new' do
    context 'when called with no arguments'

    context 'when parameters are specified'

    context 'when initialized with a seed' do
      it 'should be repeatable for the same arguments' do
        fail
      end
    end
  end

  describe '#rand' do
    it 'passes the G-test at a 95% significance level'
  end

  describe '#==' do
    context 'when compared against another Normal distribution' do
      it 'should return true if the bounds and seed are the same' do
        fail
      end

      it 'should return false if bounds / seed differ' do
        fail
      end
    end
  end
end


describe Statistical::Distribution::Normal do
  describe '.new' do
    context 'when called with no arguments'

    context 'when upper and lower bounds are specified'
  end


  describe '#pdf' do
    context 'when called with x < lower_bound'

    context 'when called with x > upper_bound'

    context 'when called with x in [lower_bound, upper_bound]'
  end

  describe '#cdf' do
    context 'when called with x < lower'

    context 'when called with x > upper'

    context 'when called with x in [lower, upper]'
  end

  describe '#quantile' do
    context 'when called for x < 0' do
      let(:ndist) {Statistical::Distribution::Normal.new}
      it {
        expect {ndist.quantile(-Float::EPSILON)}.to raise_error(RangeError)
      }
    end

    context 'when called for x > 1' do
      let(:ndist) {Statistical::Distribution::Normal.new}
      it {  
        expect {ndist.quantile(1 + Float::EPSILON)}.to raise_error(RangeError)
      }
    end

    context 'when called for x in [0, 1]' do
      let(:ndist) {Statistical::Distribution::Normal.new}
    end
  end

  describe '#p_value' do
    it 'should be the same as #quantile'
  end

  describe '#mean' do
    it 'should return the correct mean'
  end

  describe '#variance' do
    it 'should return the correct variance'
  end

  describe '#==' do
    context 'when compared against another Normal distribution' do
      it 'returns `true` if they have the same parameters'
      it 'returns `false` if they have different parameters'
    end
  end
end