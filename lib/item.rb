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
    @merchant_id  = data[:merchant_id].to_i
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end


  def merchant
    merchant_repo = MerchantRepo.get_instance
    merchant_repo.find_by_id(merchant_id)
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
