class Chisel
  attr_reader :input_file, :output_file
  def initialize(paths)
    @input_file = paths[0]
    @output_file = paths[1]
  end

  def parse_paragraph(text)
    "<p>#{text.chomp}</p>\n"
  end

  def parse_header(text)
    level = text.count('#')
    clean_text = text.tr_s('#', '').chomp.strip
    "<h#{level}>#{clean_text}</h#{level}>\n"
  end
end
