class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoices
    invoice_repo = InvoiceRepo.get_instance
    invoice_repo.find_all_by_customer_id(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def successful_invoices
    invoices.select do |invoice|
      transaction_results = invoice.transactions
      transaction_results.select { |transaction| transaction.result == 'success' }
    end
  end

  def favorite_merchant
    merchants = successful_invoices.map { |invoice| invoice.merchant }
    merchants.max_by { |seller| merchants.count(seller) }
  end

end
