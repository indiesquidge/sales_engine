require_relative '../test/test_helper'

class InvoiceRepoTest < MiniTest::Test

  def test_it_returns_all_invoices
    invoices = Invoice.new({})
    repo = InvoiceRepo.new(invoices)
    assert_equal invoices, repo.all
  end

  def test_it_can_find_one_by_id
    invoice = Invoice.new(:id => 3)
    invoice2 = Invoice.new(:id => 4)
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_id(3)
  end

  def test_it_can_find_one_by_customer_id
    invoice = Invoice.new(:customer_id => 2)
    invoice2 = Invoice.new(:customer_id => 6)
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_customer_id(2)
  end

  def test_it_can_find_one_by_merchant_id
    invoice = Invoice.new(:merchant_id => 2)
    invoice2 = Invoice.new(:merchant_id => 6)
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_merchant_id(2)
  end

  def test_it_can_find_one_by_status
    invoice = Invoice.new(:status => "shipped")
    invoice2 = Invoice.new(:status => "processing")
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_status("shipped")
  end
  def test_it_can_find_one_by_time_created
    invoice = Invoice.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice2 = Invoice.new(:created_at => "2015-01-23 08:08:45 MST")
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_one_by_time_updated
    invoice = Invoice.new(:updated_at => "2015-01-23 08:06:20 MST")
    invoice2 = Invoice.new(:updated_at => "2015-01-23 08:08:45 MST")
    invoices = [invoice, invoice2]
    repo = InvoiceRepo.new(invoices)
    assert_equal invoice, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_customer_id
    invoice = Invoice.new(:customer_id => 2)
    invoice2 = Invoice.new(:customer_id => 6)
    invoice3 = Invoice.new(:customer_id => 2)
    invoices = [invoice, invoice2, invoice3]
    repo = InvoiceRepo.new(invoices)
    assert_equal [invoice, invoice3], repo.find_all_by_customer_id(2)
  end

  def test_it_can_find_all_by_merchant_id
    invoice = Invoice.new(:merchant_id => 2)
    invoice2 = Invoice.new(:merchant_id => 6)
    invoice3 = Invoice.new(:merchant_id => 2)
    invoices = [invoice, invoice2, invoice3]
    repo = InvoiceRepo.new(invoices)
    assert_equal [invoice, invoice3], repo.find_all_by_merchant_id(2)
  end

  def test_it_can_find_all_by_status
    invoice = Invoice.new(:status => "shipped")
    invoice2 = Invoice.new(:status => "processing")
    invoice3 = Invoice.new(:status => "shipped")
    invoices = [invoice, invoice2, invoice3]
    repo = InvoiceRepo.new(invoices)
    assert_equal [invoice, invoice3], repo.find_all_by_status("shipped")
  end

  def test_it_can_find_all_by_time_created
    invoice = Invoice.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice2 = Invoice.new(:created_at => "2015-01-23 08:06:20 MST")
    invoice3 = Invoice.new(:created_at => "2015-01-23 08:08:45 MST")
    invoices = [invoice, invoice2, invoice3]
    repo = InvoiceRepo.new(invoices)
    assert_equal [invoice, invoice2], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_can_find_all_by_time_updated
    invoice = Invoice.new(:updated_at => "2015-01-23 09:01:21 MST")
    invoice2 = Invoice.new(:updated_at => "2015-01-23 09:01:21 MST")
    invoice3 = Invoice.new(:updated_at => "2015-01-23 08:09:45 MST")
    invoices = [invoice, invoice2, invoice3]
    repo = InvoiceRepo.new(invoices)
    assert_equal [invoice, invoice2], repo.find_all_by_time_updated("2015-01-23 09:01:21 MST")
  end
end
