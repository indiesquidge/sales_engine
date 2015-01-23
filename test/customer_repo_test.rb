require_relative 'support/test_helper'
require_relative '../lib/customer_repo'

class CustomerRepoTest < MiniTest::Test

  def test_it_returns_all_customers
    customers = [Customer.new({})]
    repo = CustomerRepo.new(customers)
    assert_equal customers, repo.all
  end

  def test_it_can_find_one_by_id
    customer = Customer.new(:id => 3)
    customer2 = Customer.new(:id => 4)
    customers = [customer, customer2]
    repo = CustomerRepo.new(customers)
    assert_equal customer, repo.find_by_id(3)
  end

  def test_it_can_find_one_by_first_name
    customer = Customer.new(:first_name => "Austin")
    customer2 = Customer.new(:first_name => "Edward")
    customers = [customer, customer2]
    repo = CustomerRepo.new(customers)
    assert_equal customer, repo.find_by_first_name("Austin")
  end

  def test_it_can_find_one_by_last_name
    customer = Customer.new(:last_name => "Wood")
    customer2 = Customer.new(:last_name => "McCarthy")
    customers = [customer, customer2]
    repo = CustomerRepo.new(customers)
    assert_equal customer, repo.find_by_last_name("Wood")
  end

  def test_it_can_find_one_by_time_created
    customer = Customer.new(:created_at => "2015-01-23 08:06:20 MST")
    customer2 = Customer.new(:created_at => "2015-01-23 08:08:45 MST")
    customers = [customer, customer2]
    repo = CustomerRepo.new(customers)
    assert_equal customer, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_one_by_time_updated
    customer = Customer.new(:updated_at => "2015-01-23 08:06:20 MST")
    customer2 = Customer.new(:updated_at => "2015-01-23 08:08:45 MST")
    customers = [customer, customer2]
    repo = CustomerRepo.new(customers)
    assert_equal customer, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_first_name
    customer = Customer.new(:first_name => "Austin")
    customer2 = Customer.new(:first_name => "Austin")
    customer3 = Customer.new(:first_name => "Edward")
    customers = [customer, customer2, customer3]
    repo = CustomerRepo.new(customers)
    assert_equal [customer, customer2], repo.find_all_by_first_name("Austin")
  end

  def test_it_can_find_all_by_last_name
    customer = Customer.new(:last_name => "Wood")
    customer2 = Customer.new(:last_name => "Wood")
    customer3 = Customer.new(:last_name => "McCarthy")
    customers = [customer, customer2, customer3]
    repo = CustomerRepo.new(customers)
    assert_equal [customer, customer2], repo.find_all_by_last_name("Wood")
  end

  def test_it_can_find_all_by_time_created
    customer = Customer.new(:created_at => "2015-01-23 08:06:20 MST")
    customer2 = Customer.new(:created_at => "2015-01-23 08:06:20 MST")
    customer3 = Customer.new(:created_at => "2015-01-23 08:08:45 MST")
    customers = [customer, customer2, customer3]
    repo = CustomerRepo.new(customers)
    assert_equal [customer, customer2], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_time_updated
    customer = Customer.new(:updated_at => "2015-01-23 09:01:21 MST")
    customer2 = Customer.new(:updated_at => "2015-01-23 09:01:21 MST")
    customer3 = Customer.new(:updated_at => "2015-01-23 08:09:45 MST")
    customers = [customer, customer2, customer3]
    repo = CustomerRepo.new(customers)
    assert_equal [customer, customer2], repo.find_all_by_time_updated("2015-01-23 09:01:21 MST")
  end
end
#
# class Invoice
#   def initialize()
#     @merchant_id = merchant
#   end
#
#   def merchant
#   end
# end
#
# class ModelRepository
#   def initialize(sales_engine)
#     @items_repository = items_respository
#   end
# end
#
# class Merchant < ModelRepository
#   def items
#     items_respository.find_all_by_merchant_id(id)
#   end
# end
#
# class Merchant
#   def initialize(items)
#     @items = items
#   end
#
#   def items
#     @items
#   end
# end
#
# class SalesEngine
#   item_repository = ItemRepository.new(items)
#   merchants = Parser.new(file, Merchant)
#
#   merchants.eachs do | merchant|
#     items = item_repository_find_all_items_by_merchant_id(merchant_id)
#     merchant.items = items
#   end
#   merchant_repo = MerchantRepository.new(merchants)
#
#
# end
# end
