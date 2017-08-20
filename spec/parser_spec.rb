require 'spec_helper'
require 'test_gem/parser'

RSpec.describe TestGem::Parser do
  let(:sorter) { TestGem::Sorter.new(2) }
  let(:f1) { StringIO.new('1') }
  let(:f2) { StringIO.new('1 2 1 ') }
  let(:f3) { StringIO.new('1 2 1 ' + ('a' * 2000) + '4' + ('a' * 2000)) }
  let(:parser) { described_class.new(sorter) }

  context '#parse' do
    it { expect(parser.parse(f1).to_a.size).to eq 1 }
    it { expect(parser.parse(f1).to_a.map(&:to_s)).to match_array %w(1) }

    it { expect(parser.parse(f2).to_a.size).to eq 2 }
    it { expect(parser.parse(f2).to_a.map(&:to_s)).to match_array %w(2 1) }

    it { expect(parser.parse(f3).to_a.size).to eq 2 }
    it { expect(parser.parse(f3).to_a.map(&:to_s)).to match_array %w(4 2) }
  end
end
