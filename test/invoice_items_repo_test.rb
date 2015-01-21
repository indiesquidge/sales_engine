require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items_repo.rb'
require_relative '../lib/csv_loader.rb'
require 'pry'


class InvoiceItemsRepositoryTest <  Minitest::Test
  attr_reader :sales_engine

  def setup
    @invoice_item_data    = CSVLoader.load_csv("fixtures/test_invoice_items")
    @sales_engine = Minitest::Mock.new
    # @items_repo   = ItemsRepo.new(items, sales_engine)
  end

  def test_it_exists
    assert InvoiceItemsRepo.new
  end

  def test_it_loads_csv_fixtures
    assert @invoice_item_data
  end

  def test_it_loads_fixtures
    assert_equal 15, @invoice_item_data.count
  end




end
