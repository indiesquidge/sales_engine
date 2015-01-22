require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item'
require_relative '../lib/invoice'

class InvoiceItemsTest < Minitest::Test
  def test_it_stores_an_invoice_id
    invoice_item = InvoiceItem.new({:invoice_id => 1}, nil)
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_stores_invoice_ids_as_integers_only
    invoice_item = InvoiceItem.new({:invoice_id => '1'}, nil)
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_stores_item_id
    invoice_item = InvoiceItem.new({:item_id => 539}, nil)
    assert_equal 539, invoice_item.item_id
  end

  def test_it_stores_item_ids_as_integers_only
    invoice_item = InvoiceItem.new({:invoice_id => '539'}, nil)
    assert_equal 539, invoice_item.invoice_id
  end



end

class FakeInvoiceItemRepository
  attr_accessor :invoice
  # .invoice method returns invoice_id: 2 associated with invoice_item: 9
  # item_id: 1832
  # item.rb returns instance of item associated with this
  def find_invoices_by_invoice_item_id(id)
    @invoice
  end


end

class InvoiceItemsIntegrationTest < Minitest::Test
  # .invoice method returns invoice_id: 2 associated with invoice_item_id: 9
  # item_id: 1832....
  ##See above ##
  
  def test_it_finds_related_invoices
    @invoice_items_repo = FakeInvoiceItemRepository.new
    data = {:invoice_item_id => 9}
    @invoice_item = InvoiceItem.new(data, @invoice_items_repo)

    invoice = Array.new(2){ Invoice.new }
    @invoice_items_repo.invoice = invoice

    assert_equal invoice, @invoice_item.invoice
  end





end
