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

  def find_by_item_id(id)
    find_by_attribute(:item_id, id)
  end

  def find_by_invoice_id(id)
    find_by_attribute(:invoice_id, id)
  end

  def find_by_quantity(quantity)
    find_by_attribute(:quantity, quantity)
  end

  def find_by_unit_price(price)
    find_by_attribute(:unit_price, price)
  end

  def find_by_time_created(time)
    find_by_attribute(:created_at, time)
  end

  def find_by_time_updated(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_item_id(id)
    find_all_by_attribute(:item_id, id)
  end

  def find_all_by_invoice_id(id)
    find_all_by_attribute(:invoice_id, id)
  end

  def find_all_by_quantity(quantity)
    find_all_by_attribute(:quantity, quantity)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_attribute(:unit_price, unit_price)
  end

  def find_all_by_time_created(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_all_by_time_updated(time)
    find_all_by_attribute(:updated_at, time)
  end

  private

  def find_by_attribute(attr,criteria)
    @invoice_items.detect {|invoice_item| invoice_item.send(attr.to_sym)  == criteria}
  end

  def find_all_by_attribute(attr,criteria)
    @invoice_items.select {|invoice_item| invoice_item.send(attr.to_sym) == criteria}
  end
end
