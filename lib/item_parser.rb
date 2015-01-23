class ItemParser
  attr_reader :filename

  def initialize(input_file)
    @filename = input_file
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Item.new(line,nil)
    end
  end


end
