class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(data)
    @id          = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def customer
    customer_repo = CustomerRepo.get_instance
    customer_repo.find_by_id(customer_id)
  end
end

# ========== Notes from pairing ==========
# class Invoice
#   def items
#     invoice_item_repo= InvoiceItemRepo.get_instance
#     invoice_items = invoice_item_repo.find_all_by_invoice_id(id)
#     invoice_items.map do |invoice_item|
#       invoice_item.item
#     end
#   end
# end
