class InvoiceItem
  attr_reader :invoice_id,
              :item_id,
              :id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data)
    @id         = data[:id].to_i
    @invoice_id = data[:invoice_id].to_i
    @item_id    = data[:item_id]
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

## Relationships ##

  def item
    items_repo = ItemsRepo.get_instance
    items_repo.find_by_id(item_id)
  end

end
