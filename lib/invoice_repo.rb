class InvoiceRepo

  def initialize(invoices)
    @invoices = invoices
  end

  def all
    @invoices
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    @invoices.find { |invoice| invoice.id == id }
  end

  def find_by_customer_id(id)
    @invoices.find { |invoice| invoice.customer_id == id }
  end

  def find_by_merchant_id(id)
    @invoices.find { |invoice| invoice.merchant_id == id }
  end

  def find_by_status(status)
    @invoices.find { |invoice| invoice.status == status }
  end

  def find_by_time_created(time)
    @invoices.find { |invoice| invoice.created_at == time }
  end

  def find_by_time_updated(time)
    @invoices.find { |invoice| invoice.updated_at == time }
  end

  def find_all_by_customer_id(id)
    @invoices.select { |invoice| invoice.customer_id == id }
  end

  def find_all_by_merchant_id(id)
    @invoices.select { |invoice| invoice.merchant_id == id }
  end

  def find_all_by_status(status)
    @invoices.select { |invoice| invoice.status == status }
  end

  def find_all_by_time_created(time)
    @invoices.select { |invoice| invoice.created_at == time }
  end

  def find_all_by_time_updated(time)
    @invoices.select { |invoice| invoice.updated_at == time }
  end
end
