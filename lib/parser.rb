require_relative '../test/test_helper'

class Parser
  attr_reader :filename, :repo

  def initialize(input_file, model_class_name)
    @filename = input_file
    @model_class_name = model_class_name
  end

  def parse
    file = CSV.foreach(filename, headers: true, header_converters: :symbol)
    file.map { |row| @model_class_name.new(row) }
  end
end
