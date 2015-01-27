class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoices
    invoice_repo = InvoiceRepo.get_instance
    invoice_repo.find_all_by_merchant_id(id)
  end

  def items
    item_repo = ItemsRepo.get_instance
    item_repo.find_all_by_merchant_id(id)
  end
end
