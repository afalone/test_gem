require 'spec_helper'
require 'test_gem/sorter'

RSpec.describe TestGem::Sorter do
  let(:sorter) { described_class.new(2) }

  context '.new' do
    it { expect(sorter.size).to eq 2 }
    it { expect(sorter.to_a).to be_is_a Array }
    it { expect(sorter.to_a).to be_empty }
  end

  context '#<<' do
    it { expect((sorter << '1').to_a.map(&:value)).to match_array %w(1) }
    it { expect((sorter << '1' << '2').to_a.map(&:value)).to match_array %w(2 1) }
    it { expect((sorter << '2' << '1').to_a.map(&:value)).to match_array %w(2 1) }
    it { expect((sorter << '2' << '1' << '3').to_a.map(&:value)).to match_array %w(3 2) }
  end
end
