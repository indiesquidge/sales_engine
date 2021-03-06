class InvoiceRepo
  attr_reader :invoices

  def initialize(invoices)
    @invoices = invoices
  end

  # provides class level access to the instance of InvoiceRepo
  def self.get_instance(invoices=nil)
    @invoice_repo ||= new(invoices)
  end

  def self.clear
    @invoice_repo = nil
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_customer_id(id)
    find_by_attribute(:customer_id, id)
  end

  def find_by_merchant_id(id)
    find_by_attribute(:merchant_id, id)
  end

  def find_by_status(status)
    find_by_attribute(:status, status)
  end

  def find_by_time_created(time)
    find_by_attribute(:created_at, time)
  end

  def find_by_time_updated(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_customer_id(id)
    find_all_by_attribute(:customer_id, id)
  end

  def find_all_by_merchant_id(id)
    find_all_by_attribute(:merchant_id, id)
  end

  def find_all_by_status(status)
    find_all_by_attribute(:status, status)
  end

  def find_all_by_time_created(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_all_by_time_updated(time)
    find_all_by_attribute(:updated_at, time)
  end

  private

  def find_by_attribute(attr, criteria)
    invoices.find { |invoice| invoice.send(attr.to_sym) == criteria }
  end

  def find_all_by_attribute(attr, criteria)
    invoices.select { |invoice| invoice.send(attr.to_sym) == criteria }
  end
end
