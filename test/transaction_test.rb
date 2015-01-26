require_relative "test_helper"

class TransactionTest < Minitest::Test

  def test_it_stores_an_id
    transaction_id = Transaction.new({:id => 2})
    assert_equal 2, transaction_id.id
  end

  def test_it_stores_id_as_an_integer
    transaction = Transaction.new({:id => "2"})
    assert_equal 2, transaction.id
  end

  def test_it_stores_a_credit_card_number
    transaction = Transaction.new({:credit_card_number => 4654405418249632})
    assert_equal 4654405418249632, transaction.credit_card_number
  end

  def test_it_stores_an_invoice_id
    transaction = Transaction.new({:invoice_id => 25})
    assert_equal 25, transaction.invoice_id
  end




end
