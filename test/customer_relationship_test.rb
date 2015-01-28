require_relative 'test_helper'
require_relative '../lib/customer'
require_relative '../lib/invoice_repo'
require_relative '../lib/invoice'

class CustomerRelationshipTest < MiniTest::Test

  def test_it_finds_related_invoices
    customer = Customer.new(:id => 1)
    invoice = Invoice.new(:customer_id => 1)
    invoice2 = Invoice.new(:customer_id => 2)
    invoice3 = Invoice.new(:customer_id => 1)
    InvoiceRepo.get_instance([invoice, invoice2, invoice3])
    assert_equal [invoice, invoice3], customer.invoices
  end

  def teardown
    InvoiceRepo.clear
  end
end
