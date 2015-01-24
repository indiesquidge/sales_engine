require_relative '../test/test_helper'

class CustomerTest < MiniTest::Test
  attr_reader :data, :customer

  def setup
    @data = {
              id: 1,
      first_name: "Austin",
       last_name: "Wood",
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
    @customer = Customer.new(@data)
  end

  def test_it_stores_an_id
    assert_equal 1, customer.id
  end

  def test_it_stores_a_first_name
    assert_equal "Austin", customer.first_name
  end

  def test_it_stores_a_last_name
    assert_equal "Wood", customer.last_name
  end
end
