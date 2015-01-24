require_relative '../test/test_helper'
require_relative '../lib/invoice'

class InvoiceTest < MiniTest::Test
  attr_reader :data, :invoice

  def setup
    @data = {
               id: 1,
      customer_id: 1,
      merchant_id: 101,
           status: "shipped",
       created_at: "2015-01-25 09:54:09 UTC",
       updated_at: "2015-01-29 09:54:09 UTC"
    }
    @invoice = Invoice.new(@data)
  end

  def test_it_stores_an_id
    assert_equal 1, invoice.id
  end

  def test_it_stores_a_merchant_id
    assert_equal 101, invoice.merchant_id
  end

  def test_it_stores_a_status
    assert_equal "shipped", invoice.status
  end
end
