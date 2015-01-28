require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repo'

class ItemsRelationshipTest < Minitest::Test

  def test_it_returns_associated_merchant
    items = Item.new(:merchant_id => 25)
    merch1 = Merchant.new(:id => 23)
    merch2 = Merchant.new(:id => 25)
    MerchantRepo.get_instance([merch1, merch2])
    assert_equal merch2, items.merchant
  end

  def test_it_returns_associated_invoice_items
    items = Item.new(:id => 23)
    invoice_item1 = InvoiceItem.new(:item_id => 23)
    invoice_item2 = InvoiceItem.new(:item_id => 45)
    invoice_item3 = InvoiceItem.new(:item_id => 23)
    InvoiceItemsRepo.get_instance([invoice_item1, invoice_item2, invoice_item3])
    assert_equal [invoice_item1, invoice_item3], items.invoice_items
  end

  def teardown
    MerchantRepo.clear
    InvoiceItemsRepo.clear
  end
end
