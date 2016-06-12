require 'spec_helper'
require 'statistical/rng/uniform'
require 'statistical/distribution/uniform'

describe Statistical::Rng::Uniform do
  describe '.new' do
    context 'when called with no arguments' do
      let(:obs) {Statistical::Rng::Uniform.new}

      it 'returned instance has attribute lower = 0.0' do
        expect(obs.lower).to eq(0.0)
      end

      it 'returned instance has attribute upper = 1.0' do
        expect(obs.upper).to eq(1.0)
      end
    end

    context 'when upper and lower bounds are specified' do
      let(:lo) {12}
      let(:up) {16}
      let(:dist_obj) {Statistical::Distribution::Uniform.new(lo, up)}
      let(:obs) {Statistical::Rng::Uniform.new(dist_obj, Random.new_seed)}

      it 'has the right lower bound attribute' do
        expect(obs.lower).to eq(lo)
      end

      it 'has the right upper bound attribute' do
        expect(obs.upper).to eq(up)
      end
    end

    context 'when initialized with a seed' do
      let(:seed) {Random.new_seed}
      let(:dist_obj) {Statistical::Distribution::Uniform.new}
      let(:gen_a) {Statistical::Rng::Uniform.new(dist_obj, seed)}
      let(:gen_b) {Statistical::Rng::Uniform.new(dist_obj, seed)}

      it 'should be repeatable for the same parameters' do
        expect(gen_a).to eq(gen_b)
      end
    end
  end

  describe '#rand' do
    let(:obs_default) {Statistical::Rng::Uniform.new}
    let(:lo) {12}
    let(:up) {16}
    let(:dist_obj) {Statistical::Distribution::Uniform.new(lo, up)}
    let(:obs) {Statistical::Rng::Uniform.new(dist_obj, Random.new_seed)}

    it 'passes the G-test at a 95% significance level'

    it 'returns a number between 0 and 1 by default' do
      sample = obs_default.rand
      expect(sample).to be <= 1
      expect(sample).to be >= 0
    end

    it 'returns a bounded value when bounds are specified' do
      sample = obs.rand
      expect(sample).to be <= 16
      expect(sample).to be >= 12
    end
  end

  describe '#==' do
    context 'when compared against another uniform distribution' do
      let(:seed_a) {Random.new_seed}
      let(:seed_b) {Random.new_seed}
      let(:dist_obj) {Statistical::Distribution::Uniform.new(1, 2)}
      let(:gen_a) {Statistical::Rng::Uniform.new(nil, seed_a)}
      let(:gen_a_cp) {Statistical::Rng::Uniform.new(nil, seed_a)}
      let(:gen_b) {Statistical::Rng::Uniform.new(dist_obj, seed_a)}

      it 'should return true if the bounds and seed are the same' do
        expect(gen_a).to eq(gen_a_cp)
      end

      it 'should return false if bounds / seed differ' do
        expect(gen_a).not_to eq(gen_b)
      end
    end
  end
end

describe Statistical::Distribution::Uniform do
  describe '.new' do
    context 'when called with no arguments' do
      let(:udist) {Statistical::Distribution::Uniform.new}
      it 'returned instanace has lower = 0.0' do
        expect(udist.lower).to eq(0.0)
      end

      it 'returned instanace has upper = 1.0' do
        expect(udist.upper).to eq(1.0)
      end
    end

    context 'when upper and lower bounds are specified' do
      let(:lo) {15}
      let(:up) {157.7}
      let(:udist) {Statistical::Distribution::Uniform.new(lo, up)}
      it 'should have the right lower bound set' do
        expect(udist.lower).to eq(lo)
      end

      it 'should have the right upper bound set' do
        expect(udist.upper).to eq(up)
      end
    end
  end

  describe '#pdf' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    context 'when called with x < lower' do
      it {expect(udist.pdf(-1)).to eq(0.0)}
    end

    context 'when called with x > upper' do
      it {expect(udist.pdf(2)).to eq(0.0)}
    end

    context 'when called with x in [lower, upper]' do
      it {expect(udist.pdf(rand)).to eq(1.0)}
    end
  end

  describe '#cdf' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    context 'when called with x < lower' do
      it {expect(udist.cdf(-1)).to eq(0.0)}
    end

    context 'when called with x > upper' do
      it {expect(udist.cdf(2)).to eq(1.0)}
    end

    context 'when called with x in [lower, upper]' do
      x = rand
      it {expect(udist.cdf(x)).to eq(x)}
    end
  end

  describe '#quantile' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    context 'when called for x > 1' do
      it {expect {udist.quantile(2)}.to raise_error(RangeError)}
    end

    context 'when called for x < 0' do
      it {expect {udist.quantile(-1)}.to raise_error(RangeError)}
    end

    context 'when called for x in [0, 1]' do
      x = rand
      it {expect(udist.quantile(x)).to eq(x)}
    end
  end

  describe '#p_value' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    it 'should be the same as #quantile' do
      x = rand
      expect(udist.quantile(x)).to eq(udist.p_value(x))
    end
  end

  describe '#mean' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    it 'should return the correct mean' do
      expect(udist.mean).to eq(0.5)
    end
  end

  describe '#variance' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    it 'should return the correct variance' do
      expect(udist.variance).to eq(1.0 / 12)
    end
  end

  describe '#==' do
    let(:udist) {Statistical::Distribution::Uniform.new}
    let(:udist_clone) {Statistical::Distribution::Uniform.new}
    let(:udist_impostor) {Statistical::Distribution::Uniform.new(0.5, 1.56)}

    context 'when compared against another Uniform distribution' do
      it 'returns `true` if they have the same parameters' do
        expect(udist).to eq(udist_clone)
      end

      it 'returns `false` if they have different parameters' do
        expect(udist).not_to eq(udist_impostor)
      end
    end
  end
end
