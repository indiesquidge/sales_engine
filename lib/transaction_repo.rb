class TransactionRepo

  def initialize(transactions)
    @transactions = transactions
  end

  def all
    @transactions
  end

  def random
    @transaction.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by_attribute(:invoice_id, invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)
    find_by_attribute(:credit_card_number, credit_card_number)
  end

  def find_by_result(result)
    find_by_attribute(:result, result)
  end

  def find_all_by_result(result)
    find_all_by_attribute(:result, result)
  end

  def find_by_time_created(created_at)
    find_by_attribute(:created_at, created_at)
  end

  def find_by_time_updated(updated_at)
    find_by_attribute(:updated_at, updated_at)
  end

  def find_all_by_time_created(created_at)
    find_all_by_attribute(:created_at, created_at)
  end

  def find_all_by_time_updated(updated_at)
    find_all_by_attribute(:updated_at, updated_at)
  end

  private

  def find_by_attribute(attribute,criteria)
    @transactions.detect {|x| x.send(attribute.to_sym)  == criteria}
  end

  def find_all_by_attribute(attribute,criteria)
    @transactions.select {|x| x.send(attribute.to_sym) == criteria}
  end

end
