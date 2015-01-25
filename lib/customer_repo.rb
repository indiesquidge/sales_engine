class CustomerRepo
  attr_reader :customers

  def initialize(customers)
    @customers = customers
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.find { |customer| customer.id == id }
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name == first_name }
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name == last_name }
  end

  def find_by_time_created(time)
    customers.find { |customer| customer.created_at == time }
  end

  def find_by_time_updated(time)
    customers.find { |customer| customer.updated_at == time }
  end

  def find_all_by_first_name(first_name)
    customers.select { |customer| customer.first_name == first_name }
  end

  def find_all_by_last_name(last_name)
    customers.select { |customer| customer.last_name == last_name }
  end

  def find_all_by_time_created(time)
    customers.select { |customer| customer.created_at == time }
  end

  def find_all_by_time_updated(time)
    customers.select { |customer| customer.updated_at == time }
  end
end
