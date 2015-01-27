class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :result,
              :created_at,
              :updated_at

  def initialize(data)
    @id                  = data[:id].to_i
    @invoice_id          = data[:invoice_id]
    @credit_card_number  = data[:credit_card_number]
    @result              = data[:result]
    @created_at          = data[:created_at]
    @updated_at          = data[:updated_at]
  end

  def invoice
    invoice_repo = InvoiceRepo.get_instance
    invoice_repo.find_by_id(invoice_id)
  end

  # invoice returns Invoices associated with transactions


  ## In Sales Engine ##
  #
  # def transactions_relationships_invoices(transaction)
  #   @invoices_repository.find_by_attribute(:id, transaction.invoice_id)
  # end





end
