require_relative 'test_helper'
require_relative '../lib/invoice_item'
require_relative '../lib/invoice_items_repo'

class InvoiceItemsRepositoryTest <  Minitest::Test

  def test_it_returns_all_invoice_items
    invoice_items = [InvoiceItem.new({})]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_items, repo.all
  end

  def test_it_loads_a_random_invoice_item
    invoice_items = [InvoiceItem.new({})]
    assert invoice_items.sample
  end

  def test_it_finds_one_by_id
    invoice_item = InvoiceItem.new(:id => 2)
    invoice_item2 = InvoiceItem.new(:id => 3)
    invoice_items = [invoice_item, invoice_item2]
    repo = InvoiceItemsRepo.new(invoice_items)
    assert_equal invoice_item, repo.find_by_id(2)
  end

  def test_it_finds_one_by_invoice_id
    invoice_id = InvoiceItem.new(:invoice_id => 5)
    invoice_id2 = InvoiceItem.new(:invoice_id => 9)
    invoice_ids = [invoice_id, invoice_id2]
    repo = InvoiceItemsRepo.new(invoice_ids)
    assert_equal invoice_id, repo.find_by_invoice_id(5)
  end

  def test_it_finds_by_item_id
    item_id = InvoiceItem.new(:item_id => 539)
    item_id2 = InvoiceItem.new(:item_id => 528)
    item_ids = [item_id, item_id2]
    repo = InvoiceItemsRepo.new(item_ids)
    assert_equal item_id, repo.find_by_item_id(539)
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



  # def test_it_finds_one_by_id
  #   item = @invoice_items_repo.find_by_id("2")
  #   assert_equal 528, item.item_id.to_i
  # end
  #
  # def test_it_finds_invoice_items_by_item_id
  #   result = @invoice_items_repo.find_by_item_id("523")
  #   assert_equal BigDecimal.new(34873), result.unit_price.to_i
  # end
  #
  # def test_it_finds_by_invoice_id
  #   result = @invoice_items_repo.find_by_invoice_id(2)
  #   assert_equal 1832, result.item_id.to_i
  # end
  #
  # def test_it_can_find_all_by_invoice_id
  #   result = @invoice_items_repo.find_all_by_invoice_id(1)
  #   assert_equal 8, result.invoice_id.size
  # end
  #
  # def test_it_can_find_by_quantity
  #   result = @invoice_items_repo.find_by_quantity(9)
  #   assert_equal "528", result.item_id
  # end
  #
  # def test_it_can_find_by_unit_price
  #   result = @invoice_items_repo.find_by_unit_price("31099")
  #   assert_equal 2, result.invoice_id
  #   assert_equal "12", result.id
  # end

end
