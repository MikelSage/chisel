require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/chisel.rb'

class ChiselTest < Minitest::Test
  attr_reader :chisel
  def setup
    @chisel = Chisel.new
  end

  def test_it_exists
    assert_instance_of Chisel, chisel
  end
end
