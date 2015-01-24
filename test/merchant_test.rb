require_relative '../test/test_helper'

class MerchantTest < MiniTest::Test
  attr_reader :data, :merchant

  def setup
    @data = {
              id: 1,
            name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
    @merchant = Merchant.new(@data)
  end

  def test_it_stores_an_id
    assert_equal 1, merchant.id
  end

  def test_it_stores_a_name
    assert_equal "Schroeder-Jerde", merchant.name
  end
end
