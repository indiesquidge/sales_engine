require 'csv'

class InvoiceItemsParser
  attr_reader :filename

  def initialize(input_filename)
    @filename = input_filename
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      InvoiceItem.new(line,nil)
    end
  end


end
