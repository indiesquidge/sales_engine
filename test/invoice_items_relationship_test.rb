require_relative 'test_helper'

class InvoiceItemsRelationshipTest < Minitest::Test

  def test_it_returns_associated_item
    invoice_item = InvoiceItem.new(:item_id => 45)
    items1 = Item.new(:id => 23)
    items2 = Item.new(:id => 45)
    ItemsRepo.get_instance([items1, items2])
    assert_equal items2, invoice_item.item
  end


end
