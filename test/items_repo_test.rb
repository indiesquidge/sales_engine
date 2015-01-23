require_relative 'test_helper'

class ItemsRepositoryTest <  Minitest::Test
  attr_reader :sales_engine

  def setup
    file    = "./data/fixtures/test_items.csv"
    @items_repo = ItemsRepo.new(file, nil)
  end

  def test_it_exists
    assert @items_repo
  end

  def test_it_loads_all_items_in_repo
    assert @items_repo.all
    assert_equal 15, @items_repo.all.count
  end

  def test_it_loads_a_random_invoice_item
    assert @items_repo.random
  end



end
