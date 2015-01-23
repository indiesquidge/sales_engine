require_relative './support/test_helper'
require_relative '../lib/parser'

class ParserTest < MiniTest::Test

  def test_it_can_parse_csv_from_a_file
    filename = "test/support/sample_customers.csv"
    parser = Parser.new(filename, Customer)
    customers = parser.parse

    first_customer = customers.first
    assert_equal 1, first_customer.id
    assert_equal "Joey", first_customer.first_name

    second_customer = customers[1]
    assert_equal 2, second_customer.id
    assert_equal "Cecelia", second_customer.first_name
  end
end

# Sales Engine
#   customers = Parse the customert the customer csv
#   Create a customer repo
#   Put customers in to customer repo
#
#   merchants = Parse merchaants file
#   Create merchant repo
#   Put merchants into customer repo
#
