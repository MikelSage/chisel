class Chisel
  attr_reader :input_file, :output_file
  def initialize(paths)
    @input_file = paths[0]
    @output_file = paths[1]
  end

  def parse_paragraph(text)
    "<p>#{text[0..-2]}</p>\n"
  end
end
