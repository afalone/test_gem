class TestGem::Parser
  attr_reader :sorter

  def initialize(sorter)
    @sorter = sorter
    @buffer = ''
  end

  def parse(io)
    read_tail(io)

    until @buffer.empty?
      read_tail(io) if @buffer.size <= 1000
      pos = take_num
      clean(pos)
    end

    sorter
  end

  private

  def read_tail(io)
    @buffer += io.read(2000 - @buffer.length).to_s
  end

  def take_num
    start = skip_to
    copy_from(start)
  end

  def skip_to
    @buffer[0, [@buffer.size, 1000].min].chars.find_index { |char| ('0'..'9').include?(char) } || [@buffer.size, 1000].min
  end

  def copy_from(start)
    size = @buffer[start, [@buffer.size - start, 1000].min].chars.find_index { |char| !('0'..'9').include?(char) }
    size ||= [@buffer.size - start, 1000].min
    sorter << @buffer[start, size] if size.positive?
    start + size
  end

  def clean(pos)
    @buffer = @buffer[pos..-1]
  end
end
