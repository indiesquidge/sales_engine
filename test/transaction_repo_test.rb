require_relative 'test_helper'
require_relative '../lib/transaction_repo'
require_relative '../lib/transaction'

class TransactionRepositoryTest <  Minitest::Test

  def test_it_returns_all_transaction_items
    transactions = [Transaction.new({})]
    repo = TransactionRepo.new(transactions)
    assert_equal transactions, repo.all
  end

  def test_it_finds_one_by_id
    transaction = Transaction.new(:id => 4)
    transaction2 = Transaction.new(:id => 5)
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_id(5)
  end

  def test_it_finds_one_by_invoice_id
    transaction = Transaction.new(:invoice_id => 14)
    transaction2 = Transaction.new(:invoice_id => 25)
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_invoice_id(25)
  end

  def test_it_finds_one_by_credit_card_number
    transaction = Transaction.new(:credit_card_number => 4654405418249632)
    transaction2 = Transaction.new(:credit_card_number => 4580251236515201)
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_credit_card_number(4580251236515201)
  end

  def test_it_finds_one_by_result
    transaction = Transaction.new(:result => "success")
    transaction2 = Transaction.new(:result => "failed")
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_result("failed")
  end

  def test_it_finds_all_by_result
    transaction = Transaction.new(:result => "success")
    transaction2 = Transaction.new(:result => "failed")
    transaction3 = Transaction.new(:result => "failed")
    transactions = [transaction, transaction2, transaction3]
    repo = TransactionRepo.new(transactions)
    assert_equal [transaction2, transaction3], repo.find_all_by_result("failed")
  end

  def test_it_finds_transaction_by_time_created
    transaction = Transaction.new(:created_at => "2015-01-23 08:08:45 MST")
    transaction2 = Transaction.new(:created_at => "2015-01-23 08:06:20 MST")
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_finds_transaction_by_time_updated
    transaction = Transaction.new(:updated_at => "2015-01-23 08:08:45 MST")
    transaction2 = Transaction.new(:updated_at => "2015-01-23 08:06:20 MST")
    transactions = [transaction, transaction2]
    repo = TransactionRepo.new(transactions)
    assert_equal transaction2, repo.find_by_time_updated("2015-01-23 08:06:20 MST")
  end

  def test_it_finds_all_transactions_by_time_created
    transaction = Transaction.new(:created_at => "2015-01-23 08:08:45 MST")
    transaction2 = Transaction.new(:created_at => "2015-01-23 08:06:20 MST")
    transaction3 = Transaction.new(:created_at => "2015-01-23 08:06:20 MST")
    transactions = [transaction, transaction2, transaction3]
    repo = TransactionRepo.new(transactions)
    assert_equal [transaction2, transaction3], repo.find_all_by_time_created("2015-01-23 08:06:20 MST")
  end

  def test_it_finds_all_transactions_by_time_updated
    transaction = Transaction.new(:updated_at => "2015-01-23 08:08:45 MST")
    transaction2 = Transaction.new(:updated_at => "2015-01-23 08:06:20 MST")
    transaction3 = Transaction.new(:updated_at => "2015-01-23 08:06:20 MST")
    transactions = [transaction, transaction2, transaction3]
    repo = TransactionRepo.new(transactions)
    assert_equal [transaction2, transaction3], repo.find_all_by_time_updated("2015-01-23 08:06:20 MST")
  end

end
