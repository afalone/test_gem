require 'test_gem/version'
require 'test_gem/sorter'
require 'test_gem/parser'

module TestGem
  def run(count)
    sorter = Sorter.new(count)
    numbers = Parser.new(sorter).parse($stdin)
    numbers.each do |number|
      puts number
    end
  end

  module_function :run
end
