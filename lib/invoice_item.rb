class InvoiceItem
  attr_reader :invoice_id, :item_id, :id

  def initialize(data, parent)
    @invoice_id = data[:invoice_id].to_i
    @item_id    = data[:item_id]
    @id = data[:id]  #invoice_item_id or first column
    @parent = parent
  end

  def invoice
    @parent.find_invoices_by_invoice_item_id(id)
  end



end
