require_relative 'test_helper'

class MerchantRelationshipTest < MiniTest::Test

  def test_it_finds_related_items
    merchant = Merchant.new(:id => 1)
    item = Item.new(:merchant_id => 1)
    item2 = Item.new(:merchant_id => 2)
    item3 = Item.new(:merchant_id => 1)
    ItemsRepo.get_instance([item, item2, item3])
    assert_equal [item, item3], merchant.items
  end

  def test_it_finds_related_invoices
    merchant = Merchant.new(:id => 1)
    invoice = Invoice.new(:merchant_id => 1)
    invoice2 = Invoice.new(:merchant_id => 2)
    invoice3 = Invoice.new(:merchant_id => 1)
    InvoiceRepo.get_instance([invoice, invoice2, invoice3])
    assert_equal [invoice, invoice3], merchant.invoices
  end

  def teardown
    ItemsRepo.clear
    InvoiceRepo.clear
  end
end
