require_relative 'test_helper'

class InvoiceRelationshipTest < MiniTest::Test

  def test_it_returns_associated_customer
    invoice = Invoice.new(:customer_id => 1)
    customer = Customer.new(:id => 1)
    customer2 = Customer.new(:id => 2)
    CustomerRepo.get_instance([customer, customer2])
    assert_equal customer, invoice.customer
  end

  def teardown
    CustomerRepo.clear
  end
end
