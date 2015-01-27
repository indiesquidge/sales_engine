require_relative 'test_helper'

class InvoiceRelationshipTest < MiniTest::Test

  def test_it_returns_associated_customer
    invoice = Invoice.new(:customer_id => 1)
    customer = Customer.new(:id => 1)
    customer2 = Customer.new(:id => 2)
    CustomerRepo.get_instance([customer, customer2])
    assert_equal customer, invoice.customer
  end

  def test_it_returns_associated_merchant
    invoice = Invoice.new(:merchant_id => 1)
    merchant = Merchant.new(:id => 1)
    merchant2 = Merchant.new(:id => 2)
    MerchantRepo.get_instance([merchant, merchant2])
    assert_equal merchant, invoice.merchant
  end

  def test_it_returns_associated_transactions
    invoice = Invoice.new(:id => 1)
    transaction = Transaction.new(:invoice_id => 2)
    transaction2 = Transaction.new(:invoice_id => 1)
    transaction3 = Transaction.new(:invoice_id => 1)
    TransactionRepo.get_instance([transaction, transaction2, transaction3])
    assert_equal [transaction2, transaction3], invoice.transactions
  end

  def test_it_returns_associated_invoice_items
    invoice = Invoice.new(:id => 1)
    invoice_item = InvoiceItem.new(:invoice_id => 2)
    invoice_item2 = InvoiceItem.new(:invoice_id => 1)
    invoice_item3 = InvoiceItem.new(:invoice_id => 1)
    InvoiceItemsRepo.get_instance([invoice_item, invoice_item2, invoice_item3])
    assert_equal [invoice_item2, invoice_item3], invoice.invoice_items
  end

  def test_it_returns_associated_items_by_way_of_invoice_items
    invoice = Invoice.new(:id => 1)
    invoice_item = InvoiceItem.new({:invoice_id => 2, :item_id => 13})
    invoice_item2 = InvoiceItem.new({:invoice_id => 1, :item_id => 1})
    invoice_item3 = InvoiceItem.new({:invoice_id => 1, :item_id => 12})
    InvoiceItemsRepo.get_instance([invoice_item, invoice_item2, invoice_item3])
    item = Item.new(:id => 1)
    item2 = Item.new(:id => 12)
    item3 = Item.new(:id => 30)
    ItemsRepo.get_instance([item, item2, item3])
    assert_equal [item, item2], invoice.items
  end

  def teardown
    CustomerRepo.clear
    MerchantRepo.clear
    TransactionRepo.clear
    InvoiceItemsRepo.clear
    ItemsRepo.clear
  end
end
