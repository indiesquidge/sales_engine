require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemsTest < Minitest::Test

  def test_it_stores_an_invoice_id
    invoice_item = InvoiceItem.new({:invoice_id => 1})
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_stores_invoice_ids_as_integers_only
    invoice_item = InvoiceItem.new({:invoice_id => '1'})
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_stores_item_id
    invoice_item = InvoiceItem.new({:item_id => 539})
    assert_equal 539, invoice_item.item_id
  end

  def test_it_stores_item_ids_as_integers_only
    invoice_item = InvoiceItem.new({:invoice_id => '539'})
    assert_equal 539, invoice_item.invoice_id
  end
end
