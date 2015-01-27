require_relative 'test_helper'

class InvoiceItemsRelationshipTest < Minitest::Test

  def test_it_returns_associated_items
    invoice_item = InvoiceItem.new(:item_id => 45)
    items1 = Item.new(:id => 23)
    items2 = Item.new(:id => 45)
    ItemsRepo.get_instance([items1, items2])
    assert_equal items2, invoice_item.item
  end

  def test_it_returns_associated_invoice
    invoice_item = InvoiceItem.new(:invoice_id => 25)
    invoice1 = Invoice.new(:id => 23)
    invoice2 = Invoice.new(:id => 25)
    InvoiceRepo.get_instance([invoice1, invoice2])
    assert_equal invoice2, invoice_item.invoice
  end

  def teardown
    ItemsRepo.clear
    InvoiceRepo.clear
  end
end
