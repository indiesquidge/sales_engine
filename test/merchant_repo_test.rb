require_relative '../test/test_helper'
require_relative '../lib/merchant_repo.rb'
require_relative '../lib/merchant.rb'

class MerchantRepoTest < MiniTest::Test

  def test_it_returns_all_merchants
    merchants = [Merchant.new({})]
    repo = MerchantRepo.new(merchants)
    assert_equal merchants, repo.all
  end

  def test_it_can_find_one_by_id
    merchant = Merchant.new(:id => 3)
    merchant2 = Merchant.new(:id => 4)
    merchants = [merchant, merchant2]
    repo = MerchantRepo.new(merchants)
    assert_equal merchant, repo.find_by_id(3)
  end

  def test_it_can_find_one_by_name
    merchant = Merchant.new(:name => "Austin")
    merchant2 = Merchant.new(:name => "Edward")
    merchants = [merchant, merchant2]
    repo = MerchantRepo.new(merchants)
    assert_equal merchant, repo.find_by_name("Austin")
  end

  def test_it_can_find_one_by_time_created
    merchant = Merchant.new(:created_at => "2015-01-23 08:06:20 MST")
    merchant2 = Merchant.new(:created_at => "2015-01-23 08:08:45 MST")
    merchants = [merchant, merchant2]
    repo = MerchantRepo.new(merchants)
    assert_equal merchant, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_one_by_time_updated
    merchant = Merchant.new(:updated_at => "2015-01-23 08:06:20 MST")
    merchant2 = Merchant.new(:updated_at => "2015-01-23 08:08:45 MST")
    merchants = [merchant, merchant2]
    repo = MerchantRepo.new(merchants)
    assert_equal merchant, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all
    merchant = Merchant.new(:name => "Austin")
    merchant2 = Merchant.new(:name => "Edward")
    merchant3 = Merchant.new(:name => "Austin")
    merchants = [merchant, merchant2, merchant3]
    repo = MerchantRepo.new(merchants)
    assert_equal [merchant, merchant3], repo.find_all_by_name("Austin")
  end

  def test_it_can_find_all_by_time_created
    merchant = Merchant.new(:created_at => "2015-01-23 08:06:20 MST")
    merchant2 = Merchant.new(:created_at => "2015-01-23 08:06:20 MST")
    merchant3 = Merchant.new(:created_at => "2015-01-23 08:08:45 MST")
    merchants = [merchant, merchant2, merchant3]
    repo = MerchantRepo.new(merchants)
    assert_equal [merchant, merchant2], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_time_updated
    merchant = Merchant.new(:updated_at => "2015-01-23 09:01:21 MST")
    merchant2 = Merchant.new(:updated_at => "2015-01-23 09:01:21 MST")
    merchant3 = Merchant.new(:updated_at => "2015-01-23 08:09:45 MST")
    merchants = [merchant, merchant2, merchant3]
    repo = MerchantRepo.new(merchants)
    assert_equal [merchant, merchant2], repo.find_all_by_time_updated("2015-01-23 09:01:21 MST")
  end
end
