class CustomerRepo
  attr_reader :customers

  def initialize(customers)
    @customers = customers
  end

  def self.get_instance(customers=nil)
    @customer_repo ||= new(customers)
  end

  def self.clear
    @customer_repo = nil
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_first_name(first_name)
    find_by_attribute(:first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_by_attribute(:last_name, last_name)
  end

  def find_by_time_created(time)
    find_by_attribute(:created_at, time)
  end

  def find_by_time_updated(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_first_name(first_name)
    find_all_by_attribute(:first_name, first_name)
  end

  def find_all_by_last_name(last_name)
    find_all_by_attribute(:last_name, last_name)
  end

  def find_all_by_time_created(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_all_by_time_updated(time)
    find_all_by_attribute(:updated_at, time)
  end

  private 

  def find_by_attribute(attr, criteria)
    customers.find { |customer| customer.send(attr.to_sym) == criteria }
  end

  def find_all_by_attribute(attr, criteria)
    customers.select { |customer| customer.send(attr.to_sym) == criteria }
  end
end
