require_relative 'test_helper'
require_relative '../lib/invoice_item'
require_relative '../lib/invoice_items_repo'

class InvoiceItemsRepositoryTest <  Minitest::Test

  def test_it_returns_all_invoice_items
    invoice_items = [InvoiceItem.new({})]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_items, repo.all
  end

  def test_it_finds_one_by_id
    invoice_item = InvoiceItem.new(:id => 2)
    invoice_item2 = InvoiceItem.new(:id => 3)
    invoice_items = [invoice_item, invoice_item2]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_item, repo.find_by_id(2)
  end

  def test_it_finds_one_by_item_id
    item_id = InvoiceItem.new(:item_id => 539)
    item_id2 = InvoiceItem.new(:item_id => 528)
    item_ids = [item_id, item_id2]
    repo = InvoiceItemsRepo.new(item_ids)
    assert_equal item_id, repo.find_by_item_id(539)
  end

  def test_it_finds_one_by_invoice_id
    invoice_id = InvoiceItem.new(:invoice_id => 5)
    invoice_id2 = InvoiceItem.new(:invoice_id => 9)
    invoice_ids = [invoice_id, invoice_id2]
    repo = InvoiceItemsRepo.new(invoice_ids)
    assert_equal invoice_id, repo.find_by_invoice_id(5)
  end

  def test_it_finds_one_by_quantity
    quantity = InvoiceItem.new(:quantity => 5)
    quantity2 = InvoiceItem.new(:quantity => 9)
    repo = InvoiceItemsRepo.new([quantity, quantity2])
    assert_equal quantity, repo.find_by_quantity(5)
  end

  def test_it_finds_one_by_unit_price
    unit_price = InvoiceItem.new(:unit_price => 13635)
    unit_price2 = InvoiceItem.new(:unit_price => 23324)
    repo = InvoiceItemsRepo.new([unit_price, unit_price2])
    assert_equal unit_price, repo.find_by_unit_price(13635)
  end

  def test_it_can_find_one_by_time_created
    invoice_item = InvoiceItem.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice_item2 = InvoiceItem.new(:created_at => "2015-01-23 08:08:45 MST")
    invoice_items = [invoice_item, invoice_item2]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_item, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_one_by_time_updated
    invoice_item = InvoiceItem.new(:updated_at => "2015-01-23 08:06:20 MST")
    invoice_item2 = InvoiceItem.new(:updated_at => "2015-01-23 08:08:45 MST")
    invoice_items = [invoice_item, invoice_item2]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_item, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_finds_all_by_item_id
    item_id = InvoiceItem.new(:item_id => 635)
    item_id2 = InvoiceItem.new(:item_id => 324)
    item_id3 = InvoiceItem.new(:item_id => 324)
    repo = InvoiceItemsRepo.new([item_id, item_id2, item_id3])
    assert_equal [item_id2, item_id3], repo.find_all_by_item_id(324)
  end

  def test_it_finds_all_by_invoice_id
    invoice_id = InvoiceItem.new(:invoice_id => 4)
    invoice_id2 = InvoiceItem.new(:invoice_id => 5)
    invoice_id3 = InvoiceItem.new(:invoice_id => 4)
    repo = InvoiceItemsRepo.new([invoice_id, invoice_id2, invoice_id3])
    assert_equal [invoice_id, invoice_id3], repo.find_all_by_invoice_id(4)
  end

  def test_it_finds_all_by_quantity
    quantity = InvoiceItem.new(:quantity => 4)
    quantity2 = InvoiceItem.new(:quantity => 5)
    quantity3 = InvoiceItem.new(:quantity => 4)
    repo = InvoiceItemsRepo.new([quantity, quantity2, quantity3])
    assert_equal [quantity, quantity3], repo.find_all_by_quantity(4)
  end

  def test_it_finds_all_by_unit_price
    unit_price = InvoiceItem.new(:unit_price => 41133)
    unit_price2 = InvoiceItem.new(:unit_price => 52344)
    unit_price3 = InvoiceItem.new(:unit_price => 41133)
    repo = InvoiceItemsRepo.new([unit_price, unit_price2, unit_price3])
    assert_equal [unit_price, unit_price3], repo.find_all_by_unit_price(41133)
  end

  def test_it_can_find_all_by_time_created
    invoice_item = InvoiceItem.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice_item2 = InvoiceItem.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice_item3 = InvoiceItem.new(:created_at => "2015-01-23 08:08:45 MST")
    invoice_items = [invoice_item, invoice_item2, invoice_item3]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal [invoice_item, invoice_item2], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_time_updated
    invoice_item = InvoiceItem.new(:updated_at => "2015-01-23 09:01:21 MST")
    invoice_item2 = InvoiceItem.new(:updated_at => "2015-01-23 09:01:21 MST")
    invoice_item3 = InvoiceItem.new(:updated_at => "2015-01-23 08:09:45 MST")
    invoice_items = [invoice_item, invoice_item2, invoice_item3]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal [invoice_item, invoice_item2], repo.find_all_by_time_updated("2015-01-23 09:01:21 MST")
  end
end
