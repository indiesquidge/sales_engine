class InvoiceItem
  attr_reader :invoice_id,
              :item_id,
              :id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data)
    @id         = data[:id] #invoice_item_id or first column
    @invoice_id = data[:invoice_id].to_i
    @item_id    = data[:item_id]
    # @parent     = parent  # Should be going to the repo
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoice
    @parent.find_invoices_by_invoice_item_id(id)
  end

  ## Parent should be invoice_items_repo

end
