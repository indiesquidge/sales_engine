require 'minitest/autorun'
require 'minitest/pride'

class InvoiceItemsTest < Minitest::Test
  def test_it_stores_an_invoice_id
    invoice_item = InvoiceItem.new({:invoice_id => 1}, nil)
    assert_equal 8, invoice_items.invoice_id
  end


end

class InvoiceItemsIntegrationTest < Minitest::Test
  # return instance of invoice associated with invoice item
  # item.rb returns instance of item associated with this



end
