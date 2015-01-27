require_relative 'test_helper'

class TransactionRelationshipTest < Minitest::Test

def test_it_returns_associated_merchant
  item = Item.new(:merchant_id => 345)
  merchant1 = Merchant.new(:id => 231)
  merchant2 = Merchant.new(:id => 345)
  MerchantRepo.get_instance([merchant1, merchant2])
  assert_equal merchant2, item.merchant
end

def teardown
  MerchantRepo.clear
end

end
