require_relative 'test_helper'

class TransactionRelationshipTest < Minitest::Test

def test_it_returns_associated_invoice
  transaction = Transaction.new(:invoice_id => 25)
  invoice1 = Invoice.new(:id => 23)
  invoice2 = Invoice.new(:id => 25)
  InvoiceRepo.get_instance([invoice1, invoice2])
  assert_equal invoice2, transaction.invoice
end

def teardown
  InvoiceRepo.clear
end

end
