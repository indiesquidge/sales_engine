require_relative '../test/test_helper'

class Parser

  def self.parse(input_file, model_class_name)
    file = CSV.foreach(input_file, headers: true, header_converters: :symbol)
    file.map { |row| model_class_name.new(row) }
  end
end
