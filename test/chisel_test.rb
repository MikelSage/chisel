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
    assert_instance_of File, chisel.input_file
    assert_instance_of File, chisel.output_file
  end

  def test_it_can_parse_a_paragraph
    input = "You just have to try the cheesecake\n"
    expected = "<p>You just have to try the cheesecake</p>\n"

    assert_equal expected, chisel.parse_paragraph(input)
  end

  def test_it_can_parse_a_header
    input = "#This is a header\n"
    input2 = "## This is another header.\n"

    assert_equal "<h1>This is a header</h1>\n", chisel.parse_header(input)
    assert_equal "<h2>This is another header.</h2>\n", chisel.parse_header(input2)
  end

  # def test_it_can_convert_paragraphs_and_headers
  #   expected = "<h1>My Life in Desserts</h1>\n" +
  #         "<h2>Chapter 1: The Beginning</h2>\n" +
  #         "<p>\"You just *have* to try the cheesecake,\" he said. \"Ever " +
  #         "since it appeared in **Food & Wine** this place has been packed " +
  #         "every night.\"</p>\n"
  #   assert_equal expected, File.read("./data/my_output.html")
  # end
end
