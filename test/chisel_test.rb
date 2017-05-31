require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/chisel.rb'

class ChiselTest < Minitest::Test
  attr_reader :chisel
  def setup
    @chisel = Chisel.new(['./data/my_input.md', './data/my_output.html'])
  end

  def test_it_exists_and_knows_its_file_paths
    assert_instance_of Chisel, chisel
    assert_equal './data/my_input.md', chisel.input_file
    assert_equal './data/my_output.html', chisel.output_file
  end

  
end
