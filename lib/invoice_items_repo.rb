require 'csv'
require 'pry'
require_relative '../lib/invoice_items_parser'
require_relative '../lib/invoice_item'

class InvoiceItemsRepo
  attr_reader :invoice_items_array, :data

  def initialize(data, parent)
    invoice_items = InvoiceItemsParser.new(data)
    @data = invoice_items.parse
  end

  def all
    data
  end

  def random
    data.sample
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

  private

  def find_by_attribute(attribute,criteria)
    data.detect {|x| x.send(attribute.to_sym)  == criteria}
  end

  def find_all_by_attribute(attribute,criteria)
    data.detect {|x| x.send(attribute.to_sym) == criteria}
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
