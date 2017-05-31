class Chisel
  attr_reader :input_file, :output_file
  def initialize(paths)
    @input_file = File.open(paths[0], 'r')
    @output_file = File.open(paths[1], 'w')
  end

  def parse_paragraph(text)
    "<p>#{text.chomp}</p>\n"
  end

  def parse_header(text)
    level = text.count('#')
    clean_text = text.tr_s('#', '').chomp.strip
    "<h#{level}>#{clean_text}</h#{level}>\n"
  end

  def convert
    input_file.each do |line|
      if line[0] == '#'
        to_write = parse_header(line)
      else
        to_write = parse_paragraph(line) unless line.chomp.empty?
      end
      output_file.write(to_write)
    end
  end
end

chisel = Chisel.new(ARGV)

chisel.convert
