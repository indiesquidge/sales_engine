class TransactionRepo
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def self.get_instance(transactions=nil)
    @transaction_repo ||= new(transactions)
  end

  def self.clear
    @transaction_repo = nil
  end

  def all
    transactions
  end

  def random
    transaction.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_invoice_id(id)
    find_by_attribute(:invoice_id, id)
  end

  def find_by_credit_card_number(number)
    find_by_attribute(:credit_card_number, number)
  end

  def find_by_result(result)
    find_by_attribute(:result, result)
  end

  def find_by_time_created(time)
    find_by_attribute(:created_at, time)
  end

  def find_by_time_updated(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_invoice_id(id)
    find_all_by_attribute(:invoice_id, id)
  end

  def find_all_by_credit_card_number(number)
    find_all_by_attribute(:credit_card_number, number)
  end

  def find_all_by_result(result)
    find_all_by_attribute(:result, result)
  end

  def find_all_by_time_created(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_all_by_time_updated(time)
    find_all_by_attribute(:updated_at, time)
  end

  private

  def find_by_attribute(attr,criteria)
    @transactions.detect { |transaction| transaction.send(attr.to_sym)  == criteria }
  end

  def find_all_by_attribute(attr,criteria)
    @transactions.select { |transaction| transaction.send(attr.to_sym) == criteria }
  end
end
