class InvoiceItemsRepo
  attr_reader :invoice_items

  def initialize(invoice_items)
    @invoice_items = invoice_items
  end

  def self.get_instance(invoice_items=nil)
    @invoice_repo ||= new(invoice_items)
  end

  def self.clear
    @invoice_repo = nil
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_item_id(item_id)
    find_by_attribute(:item_id, item_id)
  end

  def find_by_invoice_id(invoice_id)
    find_by_attribute(:invoice_id, invoice_id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_attribute(:invoice_id, invoice_id)
  end

  def find_by_quantity(quantity)
    find_by_attribute(:quantity, quantity)
  end

  def find_by_unit_price(unit_price)
    find_by_attribute(:unit_price, unit_price)
  end

  def find_by_time_created(created_at)
    find_by_attribute(:created_at, created_at)
  end

  def find_by_time_updated(updated_at)
    find_by_attribute(:updated_at, updated_at)
  end

  def find_all_by_time_created(created_at)
    find_all_by_attribute(:created_at, created_at)
  end

  def find_all_by_time_updated(updated_at)
    find_all_by_attribute(:updated_at, updated_at)
  end

  private

  def find_by_attribute(attribute,criteria)
    @invoice_items.detect {|x| x.send(attribute.to_sym)  == criteria}
  end

  def find_all_by_attribute(attribute,criteria)
    @invoice_items.select {|x| x.send(attribute.to_sym) == criteria}
  end

 ### extra relationship cases

  ## Call this on Sales Engine
  # def invoice
  #   @parent.find_invoices_by_invoice_item_id(id)
  # end

  # def item
  #   # Returns instance of item
  # end
end
