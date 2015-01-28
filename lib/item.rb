class Item
  attr_reader :id,
              :name,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(data)
    @id           = data[:id].to_i
    @name         = data[:name]
    @unit_price   = data[:unit_price]
    @merchant_id  = data[:merchant_id].to_i
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end

  def merchant
    merchant_repo = MerchantRepo.get_instance
    merchant_repo.find_by_id(merchant_id)
  end

  def invoice_items
    invoice_items_repo = InvoiceItemsRepo.get_instance
    invoice_items_repo.find_all_by_item_id(id)
  end
end
