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
    @unit_price   = data[:unit_price].to_i
    @merchant_id  = data[:merchant_id]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end


  def invoice_items
    @engine.item_relationships_invoice_items(self)
  end

  # returns InvoiceItems associated with item

  def merchant
    @engine.item_relationships_merchants(self)
  end

  # returns Merchant instances associated with this object

  ## Sales Engine ##

  # def item_relationships_invoice_items(item)
  #   @invoice_items_repository.find_all_by_attribute(:item_id, item.id)
  # end
  #
  # def item_relationships_merchants(item)
  #   @merchants_repository.find_by_attribute(:id, item.merchant_id)
  # end



end
