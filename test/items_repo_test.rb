require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/items_repo'

class ItemsRepositoryTest <  Minitest::Test

  def test_it_returns_all_items
    items = [Item.new({})]
    repo = ItemsRepo.new(items)
    assert_equal items, repo.all
  end

  def test_it_finds_item_by_name
    item = Item.new(:name => "Item Autem Minima")
    item2 = Item.new(:name => "Pocket Lint")
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item2, repo.find_by_name("Pocket Lint")
  end

  def test_it_finds_by_id
    item = Item.new(:id => 2)
    item2 = Item.new(:id => 45)
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item2, repo.find_by_id(45)
  end

  def test_it_finds_by_unit_price
    item = Item.new(:unit_price => 67076)
    item2 = Item.new(:unit_price => 45098)
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item, repo.find_by_unit_price(67076)
  end

  def test_it_can_find_one_by_time_created
    item = Item.new(:created_at => "2015-01-23 08:06:20 MST")
    item2 = Item.new(:created_at => "2015-01-23 08:08:45 MST")
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_one_by_time_updated
    item = Item.new(:updated_at => "2015-01-23 08:06:20 MST")
    item2 = Item.new(:updated_at => "2015-01-23 08:08:45 MST")
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_finds_by_merchant_id
    item = Item.new(:merchant_id => 616)
    item2 = Item.new(:merchant_id => 428)
    items = [item, item2]
    repo = ItemsRepo.new(items)
    assert_equal item, repo.find_by_merchant_id(616)
  end

  def test_it_can_find_all_merchant_id
    item = Item.new(:merchant_id => 616)
    item2 = Item.new(:merchant_id => 428)
    item3 = Item.new(:merchant_id => 616)
    items = [item, item2, item3]
    repo = ItemsRepo.new(items)
    assert_equal [item, item3], repo.find_all_by_merchant_id(616)
  end

  def test_it_can_find_all_by_time_created
    item = Item.new(:created_at => "2015-01-23 08:06:20 MST")
    item2 = Item.new(:created_at => "2015-01-23 08:06:20 MST")
    item3 = Item.new(:created_at => "2015-01-23 08:08:45 MST")
    items = [item, item2, item3]
    repo = ItemsRepo.new(items)
    assert_equal [item, item2], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_time_updated
    item = Item.new(:updated_at => "2015-01-23 09:01:21 MST")
    item2 = Item.new(:updated_at => "2015-01-23 09:01:21 MST")
    item3 = Item.new(:updated_at => "2015-01-23 08:09:45 MST")
    items = [item, item2, item3]
    repo = ItemsRepo.new(items)
    assert_equal [item, item2], repo.find_all_by_time_updated("2015-01-23 09:01:21 MST")
  end

  # def setup
  #   file    = "./data/fixtures/test_items.csv"
  #   @items_repo = ItemsRepo.new(file, nil)
  # end
  #
  # def test_it_exists
  #   assert @items_repo
  # end
  #
  # def test_it_loads_all_items_in_repo
  #   assert @items_repo.all
  #   assert_equal 15, @items_repo.all.count
  # end
  #
  # def test_it_loads_a_random_invoice_item
  #   assert @items_repo.random
  # end



end
