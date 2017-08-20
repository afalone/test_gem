class TestGem::Num
  attr_reader :value, :key

  def initialize(value)
    @value = value
    @key = format('%s%s', '0' * (1000 - value.length), value)
  end

  def to_s
    value
  end
end
