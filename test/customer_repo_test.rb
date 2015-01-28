require_relative '../test/test_helper'
require_relative '../lib/customer'
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
