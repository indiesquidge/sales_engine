require_relative 'test_helper'
require_relative '../lib/customer_repo'
require_relative '../lib/customer'
require_relative '../lib/invoice'

class CustomerIntegrationTest < MiniTest::Test

  def test_it_finds_related_invoices
    customer = Customer.new(:id => 1)
    invoice = Invoice.new(:customer_id => 1)
    invoice2 = Invoice.new(:customer_id => 2)
    InvoiceRepo.get_instance([invoice, invoice2])
    assert_equal [invoice], customer.invoices
  end
end
