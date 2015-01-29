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

  def invoices_by_date(date)
    invoice_repo = InvoiceRepo.get_instance
    invoice_repo.find_all_by_time_updated(date)
  end

  def items
    item_repo = ItemsRepo.get_instance
    item_repo.find_all_by_merchant_id(id)
  end

  def revenue(date=nil)
    associated_invoices = if date.nil?
                            invoices
                          else
                            invoices_by_date(date)
                          end
    result = 0
    associated_invoices.each do |invoice|
      associated_invoice_items = invoice.invoice_items
      associated_invoice_items.each do |invoice_item|
        result += invoice_item.quantity * invoice_item.unit_price
      end
    end
    result = BigDecimal.new(result)
  end
end
