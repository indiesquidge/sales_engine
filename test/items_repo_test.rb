require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_repo.rb'
require_relative '../lib/csv_loader.rb'
require 'pry'


class ItemsRepositoryTest <  Minitest::Test
  attr_reader :sales_engine

  # def setup
  #   @item_data    = CSVLoader.load_csv("fixtures/test_items")
  #   @sales_engine = Minitest::Mock.new
  #   # @items_repo   = ItemsRepo.new(items, sales_engine)
  # end
  #
  # def test_it_exists
  #   assert ItemsRepo.new
  # end
  #
  # def test_it_loads_csv_fixtures
  #   assert @item_data
  # end
  #
  # def test_it_loads_fixtures
  #   assert_equal 15, @item_data.count
  # end




end
