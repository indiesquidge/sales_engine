require_relative 'test_helper'

class InvoiceItemsRepositoryTest <  Minitest::Test
  attr_reader :sales_engine

  def setup
    file    = "./data/fixtures/test_invoice_items.csv"
    @invoice_items_repo = InvoiceItemsRepo.new(file, nil)
  end

  def test_it_exists
    assert @invoice_items_repo
  end

  def test_it_loads_all_items_in_repo
    assert @invoice_items_repo.all
    assert_equal 15, @invoice_items_repo.all.count
  end

  def test_it_loads_a_random_invoice_item
    assert @invoice_items_repo.random
  end

  def test_it_finds_invoice_items_by_id
    item = @invoice_items_repo.find_by_id("2")
    assert_equal 528, item.item_id.to_i
  end

  def test_it_finds_invoice_items_by_item_id
    result = @invoice_items_repo.find_by_item_id("523")
    assert_equal BigDecimal.new(34873), result.unit_price.to_i
  end

  def test_it_finds_by_invoice_id
    result = @invoice_items_repo.find_by_invoice_id(2)
    assert_equal 1832, result.item_id.to_i
  end

  def test_it_can_find_all_by_invoice_id
    result = @invoice_items_repo.find_all_by_invoice_id(1)
    assert_equal 8, result.invoice_id.size
  end

  def test_it_can_find_by_quantity
    result = @invoice_items_repo.find_by_quantity(9)
    assert_equal "528", result.item_id
  end

  def test_it_can_find_by_unit_price
    result = @invoice_items_repo.find_by_unit_price("31099")
    assert_equal 2, result.invoice_id
    assert_equal "12", result.id
  end
end
