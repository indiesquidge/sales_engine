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
    invoice_item = InvoiceItem.new(:item_id => 45)
    items1 = Item.new(:id => 23)
    items2 = Item.new(:id => 45)
    ItemsRepo.get_instance([items1, items2])
    assert_equal items2, invoice_item.item
  end

  def teardown
    MerchantRepo.clear
    ItemsRepo.clear
  end



end
