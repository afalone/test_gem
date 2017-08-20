require 'spec_helper'
require 'test_gem/num'

RSpec.describe TestGem::Num do
  let(:num) { described_class.new('10') }
  context '.new' do
    it 'set val to str' do
      expect(num.value).to eq '10'
    end

    it 'fill key with zero and val' do
      expect(num.key).to eq '0' * 998 + '10'
    end
  end

  context '#to_s' do
    it { expect(num.to_s).to eq '10' }
  end
end
