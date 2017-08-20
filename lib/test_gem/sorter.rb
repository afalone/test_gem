require 'forwardable'
require 'test_gem/num'
class TestGem::Sorter
  extend Forwardable
  
  attr_reader :size

  def_delegators :@data, :to_a
  def_delegators :to_a, :each

  def initialize(max_count)
    @data = Array.new
    @size = max_count
  end

  def <<(str)
    @data << TestGem::Num.new(str)
    @data.sort_by! { |item| item.key }.reverse!
    @data.delete_at(size) while @data.size > size
    self
  end
end
