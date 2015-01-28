require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def test_it_stores_an_id
    item_id = Item.new({:id => 2})
    assert_equal 2, item_id.id
  end

  def test_it_stores_id_as_an_integer
    item = Item.new({:id => "2"})
    assert_equal 2, item.id
  end

  def test_it_stores_a_name
    item = Item.new({:name => "Item Autem Minima"})
    assert_equal "Item Autem Minima", item.name
  end

  def test_it_stores_a_unit_price
    item = Item.new({:unit_price => 32301})
    assert_equal BigDecimal.new(32301), item.unit_price
  end
end
